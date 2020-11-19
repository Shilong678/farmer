# frozen_string_literal: true

require File.expand_path '../database.rb', __dir__
require 'rack/test'
include Rack::Test::Methods

describe 'Database' do
  before do
    table = [
      { id: 'farmdrop.com', short_url: '/abc123', url: 'http://www.farmdrop.com' },
      { id: 'google.com', short_url: '/as2d4c', url: 'http://www.google.com' },
      { id: 'facebook.com', short_url: '/2fv4d2sfv', url: 'http://www.facebook.com' }
    ]
    Database.class_variable_set(:@@database, table)
  end

  it 'find domain name from table' do
    response = { id: 'farmdrop.com', short_url: '/abc123', url: 'http://www.farmdrop.com' }
    expect(Database.find(item: 'farmdrop.com', key: 'id')).to eq response
    expect(Database.find(item: 'spotify.com', key: 'id')).to be nil
  end

  it 'create a new record' do
    Database.create(id: 'christmast.com', short_url: '/qwerty', url: 'https://christmast.com')
    expect(Database.read.length).to eq 4
    expect(Database.read.last).to include id: 'christmast.com', short_url: '/qwerty',
                                  url: 'https://christmast.com'
  end
end
