#!/usr/bin/env bash

DEPLOY_ENV=$1
BUILD_FILE_URL={{ secrets.S3_CONFIG_URL }}"/build.${env}.yaml"
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

  curl -sL $BUILD_FILE_URL > build."$env".yaml
  
  pub run build_runner build --output web:build --release --config $env &&
    rm -rf build/packages &&
    heroku static:deploy --app $deploy_app;
done
