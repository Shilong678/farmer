# frozen_string_literal: true

module UrlHelper
  def url_valid?(url)
    Typhoeus.get(url, followlocation: true).success?
  end

  def get_domain(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

  def generate_url
    '/' + SecureRandom.alphanumeric(5)
  end
end
