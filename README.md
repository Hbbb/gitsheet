# Gitx

Gitx is a command line utility designed to fetch/parse/format GitHub API data. 
Primary use cases include analytics and report-generating.

## Installation

Clone the repository:

```bash
$ git clone ssh@github.com/vervewireless/gitx.git
$ cd gitx/
```

Mac OSX Users should have a system version of Ruby installed:

```bash
$ ruby -v
```

Install Bundler:

```bash
$ gem install bundler
```

Install Gitx dependencies:

```bash
$ bundle install
```

## Configuration

Place `bin/gitx` in your `$PATH` to be able to run the command globally:

```bash
$ cp gitx/bin/gitx usr/bin
```

It is helpful to create aliases in your `.bashrc` file for common operations:

```bash
# .bashrc
alias report_git_repos='gitx repos -u maiyln -o vervewireless'
alias report_git_users='gitx users -u maiyln -o vervewireless'
```

## Usage

Synopsis:

```bash
$ gitx [type] -u [username] -p [password] -o [organization] -f [format]
```
Arguments:

`type`  is the data type to fetch. Can be either 'repos' or 'users'.

`-o` the GitHub organization to search within eg: 'vervewireless'

## Output

By default, gitx outputs raw csv data to stdout. This is useful because you can pass the output to various shell commands.

Write to a file:

```bash
$ gitx ... > report.csv
```

Keyword search through results:

```bash
$ gitx ... | grep [keyword]
```


## Examples

Get all repositories in an organization:

```bash
$ gitx repos -u testuser -p secret -o vervewireless
```

Get all members of an organization:

```bash
$ gitx users -u testuser -p secret -o vervewireless
```

Get all repositories and write output to a .csv file:

```bash
$ gitx repos -u testuser -p secret -o vervewireless -f csv > report.csv
```
