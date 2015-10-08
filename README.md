# Gitsheet

Gitsheet is a command line utility designed to fetch/parse/format GitHub API data. 
Primary use cases include analytics and report-generating. 

Gitsheet requests are authenticated using your Github credentials. As such, the results of all queries are limited to the permissions 
of your Github account.

## Installation

Install [RubyGems](https://rubygems.org/pages/download) and follow the setup instructions.

Install the Gitsheet gem:

```bash
$ gem install gitsheet
```

## Usage

Synopsis:

```bash
$ gitsheet [type] -u [username] -o [organization] -f [format]
```
Arguments:

`type`  is the data type to fetch. Can be either 'repos' or 'users'.

`-o` the GitHub organization to search within eg: 'vervewireless'

`-f` the format to output the results in. Can be either 'csv' or 'json'

## Output

By default, gitsheet outputs raw csv data to stdout. This is useful because you can pass the output to various shell commands.

Write to a file:

```bash
$ gitsheet ... > report.csv
```

Keyword search through results:

```bash
$ gitsheet ... | grep [keyword]
```

## Examples

Get all repositories in an organization:

```bash
$ gitsheet repos -u testuser -o vervewireless
```

Get all members of an organization:

```bash
$ gitsheet users -u testuser -o vervewireless
```

Get all repositories and write output to a .csv file:

```bash
$ gitsheet repos -u testuser -o vervewireless -f csv > report.csv
```

## Development

Clone the repository:

```bash
$ git clone ssh@github.com/vervewireless/gitsheet.git
$ cd gitsheet/
```

Mac OSX Users should have a system version of Ruby installed:

```bash
$ ruby -v
```

Install Bundler:

```bash
$ gem install bundler
```

Install Gitsheet dependencies:

```bash
$ bundle install
```

## TODO

Here are the next steps for Gitsheet
  - Add unit tests
  - Leverage Ruby gem to handle command line argument parsing, control flow etc.
  - Better error handling
  - More informative error messages
  - A much better name!
