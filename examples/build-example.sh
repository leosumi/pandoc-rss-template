#! /bin/bash

set -e

pandoc --template ../rss-template.xml liftoff/feed.yml -o liftoff/feed.xml
sed -i '/^$/d' liftoff/feed.xml
xmllint --format liftoff/feed.xml --output liftoff/feed.xml

pandoc --template ../rss-template.xml goupstate/feed.yml -o goupstate/feed.xml
sed -i '/^$/d' goupstate/feed.xml
xmllint --format goupstate/feed.xml --output goupstate/feed.xml
