# pandoc-rss-template

A pandoc template to convert YAML files to RSS feeds.

## Installation

1. Install [pandoc](http://pandoc.org).
2. Download the RSS [template file](rss-template.xml).
3. Put the template file in the same directory as your YAML file to convert to an RSS feed.

## Usage

1. Open a terminal and go to the directory where your YAML file is located.
2. Execute the following command:

    ```bash
    pandoc feed.yml -o feed.xml --template rss-template.xml
    ```

    where `feed.yml` is the YAML file you want to convert to `feed.xml` RSS feed.

## Example

Here is an example of YAML file that can be converted to an RSS feed:

```yaml
---
title: RSS feed for my awesome blog
description: RSS feed created with pandoc with a template
link: awesome.com
item:
  - title: An entry title
    description: The first entry
    link: awesome.com/first-entry.html
  - title: A second entry title
    description: The second entry
    link: awesome.com/second-entry.html
...
```

## License

This project is open source licensed under the GPL-3 License. Please see the [LICENSE file](LICENSE) for more information.
