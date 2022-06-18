#!/usr/bin/env bash

DEPLOY_ENV=$1

case $DEPLOY_ENV in
     "kinship-staging-all") ENVS=('tsc-staging' 'iams-staging' 'walmart-staging' 'thewildest-staging' 'greatergood-staging' 'wildestpack-staging', 'fur-life-staging');;
     "kinship-prod-all") ENVS=('tsc' 'iams' 'walmart' 'thewildest' 'greatergood', 'fur-life');;
      *) ENVS=($DEPLOY_ENV);;
esac

for env in "${ENVS[@]}"
do
  if [ $env == "prod" ]; then
    deploy_app="web-widget";
  else
    deploy_app="web-widget-${env}";
  fi

  cp "configurations/build.${env}.yaml" "build.${env}.yaml"
  
  pub run build_runner build --output web:build --release --config $env &&
    rm -rf build/packages &&
    heroku static:deploy --app $deploy_app;
done
