require 'spec_helper'

describe 'Gitsheet' do
  let(:github_client) { Gitsheet.new('testUser', 'testPass', 'testOrg') }
  let(:github_repos_mock) { File.open('./spec/support/github_repos_mock.json').read }
  let (:github_users_mock) { File.open('./spec/support/vcr/Gitsheet/_users/returns_array_of_GitHub_users_associated_with_an_organization.yml').read }
  let (:github_commits_mock) { File.open('./spec/support/github_commits_mock.json').read }

  describe '#users', :vcr do
    it 'returns array of GitHub users associated with an organization' do
      users = github_client.users
      expect(users).to eq()
    end
  end

  # describe '#repos', :vcr do
  #   it 'returns array of GitHub repositories associated with an organization' do
  #     repos = github_client.repos
  #     expect(repos).to eq(File.open('./spec/support/vcr/Gitsheet/_repos/returns_array_of_GitHub_repositories_associated_with_an_organization.yml').read)
  #   end
  # end

  describe '#latest_commit', :vcr do
    it 'returns the latest commit date of a given repository' do
      commit_data = github_client.latest_commit('tag-builder')
      expect(commit_data).to eq('2015-09-17T22:04:54Z')
    end
  end

end
