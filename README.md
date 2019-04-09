# pandoc-rss-template

A pandoc template to convert YAML files to RSS feeds. The template follows the RSS version 2.0.11 of the RSS 2.0 specification, published by the RSS Advisory Board on March 30, 2009. The current spec can be found [here](http://http://www.rssboard.org/rss-specification).

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

## Template variables

All the RSS elements described in the current RSS specification are present as template variables. Look at the specification for a correct use of the elements. Examples are also provided.

The following variables are defined and available for use in the template:

**Required channel elements**

* `title`
* `link`
* `description`

**Optional channel elements**

* `language`
* `copyright`
* `managingEditor`
* `webMaster`
* `pubDate`
* `lastBuildDate`
* `category`
* `generator`
* `docs`
* `cloud`
* `ttl`
* `image`
* `rating`
* `textInput`
* `skipHours`
* `skipDays`

**Elements of item**

* `item`
  * `title`
  * `link`
  * `description`
  * `author`
  * `category`
  * `comments`
  * `enclosure`
  * `guid`
  * `pubDate`
  * `source`

## Profile

For RSS guidelines, you can look at the RSS [Best Practices Profile](http://www.rssboard.org/rss-profile).

## Enforcement

The template do not enforce a valid use of the specification. Be aware of the following points:

* The string passed as value to a template variable is not checked for format with the specification

## Validation

To validate the generated RSS feed file, you can check it with an [RSS validator](http://www.rssboard.org/rss-validator/).

## License

This project is open source licensed under the GPL-3 License. Please see the [LICENSE file](LICENSE) for more information.
