require 'rest-client'
require 'gitx/version'
require 'gitx/pagelinks'

class Gitx
  def initialize(username, password, organization)
    @auth = "#{username}:#{password}"
    @org = organization
  end

  def repos
    repos = self.fetch_repos
    self.add_commits repos
  end

  def users
    users = self.fetch_users({per_page: 100})
  end

  def count_repos
    self.fetch_repos.size
  end

  def count_users
    self.fetch_users({per_page: 100}).size
  end

  def add_commits(repos)
    repos.each do |r|
      $stderr.print "#{r['name']}"

      sleep(1)
      $stderr.print '...'

      r['latest_commit'] = self.latest_commit(r['name'])

      $stderr.puts '✔︎'
    end
  end

  def latest_commit(repo)
    commits = self.fetch_commits(repo)
    commits.first['commit']['author']['date']
  end

  def fetch_repos(options = {})
    url = "https://#{@auth}@api.github.com/orgs/#{@org}/repos"
    repos = []

    # Initial request
    response = self.fetch(url, {per_page: 100})
    page_header = response.headers[:link]
    repos.concat JSON.parse(response)

    # Parse page headers
    pages = PageLinks.new page_header
    return repos if pages.none?

    # Fetch additional pages
    2.upto(pages.last) do |page|
      sleep(1)
      repos.concat JSON.parse(self.fetch(url, {per_page: 100, page: page}))
    end

    repos
  end

  def fetch_users(options = {})
    url = "https://#{@auth}@api.github.com/orgs/#{@org}/members"
    JSON.parse self.fetch(url, options)
  end

  def fetch_commits(repo, options = {})
    url = "https://#{@auth}@api.github.com/repos/#{@org}/#{repo}/commits"
    options.merge!(per_page: 1)
    JSON.parse self.fetch(url, options)
  end

  def fetch(url, params = {})
    RestClient.get url, {:params => params}
  end
end
