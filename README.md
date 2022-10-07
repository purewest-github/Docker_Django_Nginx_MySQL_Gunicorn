# Docker_Django_Nginx_MySQL_Gunicorn
Docker + Django + Nginx + MySQL + Gunicorn



```
# プロジェクトを新規作成
# docker-compose -f <指定するdocker-composeのファイル> run app django-admin startproject <プロジェクト名> <プロジェクトを作成するディレクトリ>

# 例：
docker-compose -f docker-compose.prod.yml run app django-admin startproject djangopj .
```



## settings.py
```
from pathlib import Path
# osのモジュールをインポート
import os

# [・・・]

# SECRET_KEYを.envから取得
SECRET_KEY = os.environ.get("SECRET_KEY")

# DEBUGを.envから取得
DEBUG = os.environ.get("DEBUG")

# ALLOWED_HOSTSを.envから取得
ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS").split(" ")

# [・・・]

# MySQLのパラメータを.envから取得
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        # コンテナ内の環境変数をDATABASESのパラメータに反映
        "NAME": os.environ.get("MYSQL_DATABASE"),
        "USER": os.environ.get("MYSQL_USER"),
        "PASSWORD": os.environ.get("MYSQL_PASSWORD"),
        "HOST": "db",
        "PORT": 3306,
    }
}


# [・・・]

# 言語を日本語に設定
LANGUAGE_CODE = ja
# タイムゾーンをAsia/Tokyoに設定
TIME_ZONE = Asia/Tokyo

# [・・・]

# STATIC_ROOTを設定
# Djangoの管理者画面にHTML、CSS、Javascriptが適用されます
STATIC_ROOT = "/static/"
STATIC_URL = "/static/"
```

