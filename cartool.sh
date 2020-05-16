#!/bin/bash

if [ $# == 1 ]
then
  env=Production-IL
elif [ $# == 2 ]
then
  case "$2" in
  il)
    env="Production-IL"
    ;;
  us)
    env="Production-US"
    ;;
  row)
    env="Production-ROW"
    ;;
  stg)
    env="Staging"
    ;;
  *)
    echo "usage: <entity> [il|us|row|stg]"
    exit 1
    ;;
  esac
else
  echo "usage: <entity> [il|us|row|stg]"
  exit 2
fi

entity=$1
case "$entity" in
*@*)
  page="user?userId=$entity"
  ;;
cp.*)
  page="carpool?carpoolId=$entity"
  ;;
it.*)
  page="itinerary?itineraryId=$entity"
  ;;
of.*)
  page="offer?offerId=$entity"
  ;;
sp.*)
  page="stickyPlan?stickyPlanId=$entity"
  ;;
gr.*)
  page="group?groupId=$entity"
  ;;
*[0-9])
  page="user?userId=$entity"
  ;;
*)
  echo "no idea what $entity is ..."
  exit 3
  ;;
esac
open "https://waze-cartool-dot-waze-tools.appspot.com/$page&env=$env"