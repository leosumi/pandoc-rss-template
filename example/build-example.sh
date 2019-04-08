#! /bin/bash

set -e

pandoc --template ../rss-template.xml feed.yml -o feed.xml
sed -i '/^$/d' feed.xml
