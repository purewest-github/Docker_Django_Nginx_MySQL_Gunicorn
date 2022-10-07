#!/bin/sh

# プロジェクトを新規作成
# docker-compose -f <指定するdocker-composeのファイル> run app django-admin startproject <プロジェクト名> <プロジェクトを作成するディレクトリ>

# 例：
docker-compose run app django-admin startproject django_pj .