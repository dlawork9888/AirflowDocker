# AIRFLOW TUTORIAL

custom airflow image

```

# 기본 파이썬 패키지 포함 !
- pandas, numpy
- selenium(+ webdriver_manager), BeautifulSoup4

# PostgreSQL 사용

# LocalExcuter

```

## Steps

1. Image Build

```
docker build -t custom_airflow_image .
````

2. Compose Up -d

```
docker compose up -d 
```

3. WebServer 

- localhost:8080 에서 웹UI 확인

