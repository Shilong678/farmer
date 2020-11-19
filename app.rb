# frozen_string_literal: true

require 'typhoeus'
require 'securerandom'
require File.expand_path 'url_helper.rb', __dir__
require File.expand_path 'database.rb', __dir__


class UrlShortener
  extend UrlHelper
  def self.find_or_create(url: )
    if url_valid?(url)
      domain = get_domain(url)
      record = Database.find(item: domain, key: 'id')
      if !record
        Database.create(id: domain, short_url: generate_url, url: url)
      else
        record
      end
    end
  end
end
