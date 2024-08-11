FROM apache/airflow:slim-2.9.3-python3.12

USER root

LABEL maintainer="tglim"

# 기본 패키지 설치
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    wget \
    git \
    vim \
    nano \
    net-tools \
    iputils-ping \
    dnsutils \
    libpq-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 필요한 파일 복사 (root 사용자로)
COPY requirements.txt /requirements.txt

# Python 패키지 설치
RUN pip3 install --no-cache-dir -r /requirements.txt

# PostgreSQL 드라이버 설치
RUN pip3 install --no-cache-dir psycopg2

# DAGs 복사
COPY --chown=airflow:root ./dags /opt/airflow/dags

# entrypoint 스크립트 복사 및 실행 권한 부여
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# entrypoint 설정
ENTRYPOINT ["/entrypoint.sh"]
