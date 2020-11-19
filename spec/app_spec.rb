# frozen_string_literal: true

require File.expand_path '../app.rb', __dir__
require 'rack/test'
include Rack::Test::Methods

describe 'Url shortener' do
  # subject { UrlShortener.new }
  # let(:table) do
  #   [
  #     { id: 'farmdrop.com', short_url: '/abc123', url: 'http://www.farmdrop.com' },
  #     { id: 'google.com', short_url: '/as2d4c', url: 'http://www.google.com' },
  #     { id: 'facebook.com', short_url: '/2fv4d2sfv', url: 'http://www.facebook.com' }
  #   ]
  # end
  # it 'checks if url is valid' do
  #   expect(subject.url_valid?('https://www.farmdrop.com/')).to be true
  #   expect(subject.url_valid?('https://farmdrop.com/')).to be true
  #   expect(subject.url_valid?('farmdrop.com')).to be true
  #   expect(subject.url_valid?(':/.farmdrop.com')).to be false
  # end

  # it 'extract domain name from a valid url' do
  #   # domain name, being uniq, will be use as id
  #   expect(subject.get_domain('https://www.farmdrop.com/')).to eq 'farmdrop.com'
  #   expect(subject.get_domain('https://farmdrop.com/')).to eq 'farmdrop.com'
  #   expect(subject.get_domain('www.farmdrop.com/')).to eq 'farmdrop.com'
  #   expect(subject.get_domain('farmdrop.com/')).to eq 'farmdrop.com'
  # end

  # it 'find domain name from table' do
  #   response = { id: 'farmdrop.com', short_url: '/abc123', url: 'http://www.farmdrop.com' }
  #   expect(subject.find(item: 'farmdrop.com',key: 'id', data: table)).to eq response
  #   expect(subject.find(item: 'spotify.com',key: 'id', data: table)).to be nil
  # end

  # it 'generates a short url' do
  #   expect(subject.generate_url).not_to be_empty
  #   expect(subject.generate_url).to match(%r{/[[:alnum:]]+})
  # end

  # it 'create a new record' do
  #   subject.create(id: 'christmast.com', short_url: '/qwerty', url: 'https://christmast.com', table: table)
  #   expect(table.length).to eq 4
  #   expect(table.last).to include id: 'christmast.com', short_url: '/qwerty',
  #                                 url: 'https://christmast.com'
  # end

end
