# frozen_string_literal: true

class Database
  @@database = []

  def self.read
    @@database
  end

  def self.find(item:, key:)
    @@database.detect { |x| x[key.to_sym] == item }
  end

  def self.create(id:, short_url:, url:)
    record = { id: id, short_url: short_url, url: url }
    @@database.push record
    @@database.last
  end
end
