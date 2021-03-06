#!/usr/bin/env bash

DEPLOY_ENV=$1
BASE_BUILD_FILE_URL=$2

case $DEPLOY_ENV in
      *) ENVS=($DEPLOY_ENV);;
esac

for env in "${ENVS[@]}"
do
  if [ $env == "prod" ]; then
    deploy_app="web-widget";
  else
    deploy_app="web-widget-${env}";
  fi

  curl -sL "$BASE_BUILD_FILE_URL/build.${env}.yaml" > "build.${env}.yaml"
  
  pub run build_runner build --output web:build --release --config $env &&
    rm -rf build/packages &&
    heroku static:deploy --app $deploy_app;
done
