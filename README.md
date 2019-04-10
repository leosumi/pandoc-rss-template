# pandoc-rss-template

A pandoc template to convert YAML files to RSS feeds.

RSS feeds use the XML format. XML files are not the most beautiful and readable because of all the tags present in them. The present template enhance the readability of the RSS feed by using the YAML format and then converting it to the XML file. The template can be use to generate feeds for static websites for instance.

The template is used with pandoc to convert the YAML file to XML file. It is a nice improvement if you want to use pandoc as a static site generator.

The template follows the RSS version 2.0.11 of the RSS 2.0 specification, published by the RSS Advisory Board on March 30, 2009. The current spec can be found [here](http://www.rssboard.org/rss-specification).

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
link: awesome.com
description: RSS feed created with pandoc with a template
item:
  - title: An entry title
    link: awesome.com/first-entry.html
    description: The first entry
  - title: A second entry title
    link: awesome.com/second-entry.html
    description: The second entry
...
```

You can look at the [examples folder](examples/) for more complete examples.

## Template variables

All the RSS elements described in the current RSS specification are present as template variables. Look at the specification for a correct use of the elements. Examples are also provided.

The following variables are defined and available for use in the template:

**Required channel elements**

* `title` required
* `link` required
* `description` required

**Optional channel elements**

* `language`
* `copyright`
* `managingEditor`
* `webMaster`
* `pubDate`
* `lastBuildDate`
* `category` list
  * `category`
  * `domain` (RSS attribute)
* `categories` list (non RSS element)
* `generator`
* `docs`
* `cloud`
  * `domain` required (RSS attribute)
  * `path` required (RSS attribute)
  * `port` required (RSS attribute)
  * `protocol` required (RSS attribute)
  * `registerProcedure` required (RSS attribute)
* `ttl`
* `image`
  * `url` required
  * `title` required
  * `link` required
  * `width`
  * `height`
  * `description`
* `rating`
* `textInput`
  * `title` required
  * `description` required
  * `name` required
  * `link` required
* `skipHours` list
* `skipDays` list

**Elements of item**

* `item`
  * `title`
  * `link`
  * `description`
  * `author`
  * `category` list
    * `category`
    * `domain` (RSS attribute)
  * `categories` list (non RSS element)
  * `comments`
  * `enclosure`
    * `url` required (RSS attribute)
    * `length` required (RSS attribute)
    * `type` required (RSS attribute)
  * `guid`
    * `guid`
    * `isPermaLink` (RSS attribute)
  * `pubDate`
  * `source`
    * `source`
    * `url` required (RSS attribute)

### Category element

The *category* element can be present multiple times. It can also take *domain* as an optional attribute. Because of the optional attribute, the category key must be written multiple times. To avoid repetitions, I created the `categories` variable that can take a list of categories, but without *domain* specified.

```yaml
---
category:
  - category: Category A
  - category: Category B
    domain: Domain of category B
  - category: Category C

categories:
  - Category X
  - Category Y
  - Category Z
...
```

### SkipHours and skipDays elements

The *skipHours* and *skipDays* elements have an hour and day sub-elements respectively in the specification. As there is no other sub-elements, *hour* and *day* do not need to be specified. The `skipHours` and `skipDays` variable are simple lists of values taken by *hour* and *day* elements respectively.


```yaml
---
skipHours:
  - 1
  - 3
  - 23

skipDays:
  - Monday
  - Wednesday
  - Sunday
...
```

### Guid and source elements

The *guid* element can take an optional RSS attribute *isPermaLink*. Because of this attribute, the `guid` variable has to be written twice even if `isPermaLink` is not used. Be aware that the default value for the *isPermaLink* attribute is set to *true* in the specification.

The `source` variable usage is similar to the `guid` variable. The only difference is that the `url` variable can not be omitted.

```yaml
---
item:
  - title: Title A
    guid:
      guid: 3241141431432143
      isPermaLink: false
  - title: Title B
    guid:
      guid: http://awesome.com/title-b
      isPermaLink: true
  - title: Title C
    guid:
      guid: http://awesome.com/title-c
    source:
      source: Title C
      url: http://awesome.com/feed.xml
...
```

## Profile

For RSS guidelines, you can look at the RSS [Best Practices Profile](http://www.rssboard.org/rss-profile).

## Enforcement

The template do not enforce a valid use of the specification. Be aware of the following points:

* The string passed as value to a template variable is not checked for format with the specification

## Validation

To validate the generated RSS feed file, you can check it with an [RSS validator](http://www.rssboard.org/rss-validator/).

## License

This project is open source licensed under the GPL-3 License. Please see the [LICENSE file](LICENSE) for more information.
