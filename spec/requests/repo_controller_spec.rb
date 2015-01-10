require 'spec_helper'
require 'rails_helper'

describe 'Repo Api endpoint' do

  before(:all) do
    Repo.delete_all
    PullRequest.delete_all
  end

  describe '#index' do
    it 'gets all the repos' do
      get '/repos'
      expect(response.status).to eq 200
      repos = JSON.parse(response.body)
      expect(repos.length).to eq 358
    end

    it 'gets the repos by parameters' do
      get '/repos?name=wdi_1_ruby_demo_basics'
      expect(response.status).to eq 200
      repos = JSON.parse(response.body)
      expect(repos.length).to eq 1
      expect(repos[0]["name"]).to eq "wdi_1_ruby_demo_basics"
    end
  end
end