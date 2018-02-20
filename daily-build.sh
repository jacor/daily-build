#!/bin/bash
if [ "$TRAVIS_PULL_REQUEST" = "false" -a "$TRAVIS_BRANCH" = "develop" ]; then
  if [ -n "$TRAVIS_EVENT_TYPE" ]
  then
    if [ $TRAVIS_EVENT_TYPE = "cron" ]
    then
      today=$(date -u +"%Y%m%d")
      git tag $today
      git push --tags origin develop
      echo Hey that\'s a large number $today.
    fi
  fi
fi
