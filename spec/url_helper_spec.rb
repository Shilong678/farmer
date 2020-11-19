require File.expand_path '../url_helper.rb', __dir__
require 'rack/test'
include Rack::Test::Methods

describe 'UrlHelper' do
  
    let(:dummy_class) { Class.new { extend UrlHelper } }


    it 'checks if url is valid' do
        expect(dummy_class.url_valid?('https://www.farmdrop.com/')).to be true
        expect(dummy_class.url_valid?('https://farmdrop.com/')).to be true
        expect(dummy_class.url_valid?('farmdrop.com')).to be true
        expect(dummy_class.url_valid?(':/.farmdrop.com')).to be false
      end
    
      it 'extract domain name from a valid url' do
        # domain name, being uniq, will be use as id
        expect(dummy_class.get_domain('https://www.farmdrop.com/')).to eq 'farmdrop.com'
        expect(dummy_class.get_domain('https://farmdrop.com/')).to eq 'farmdrop.com'
        expect(dummy_class.get_domain('www.farmdrop.com/')).to eq 'farmdrop.com'
        expect(dummy_class.get_domain('farmdrop.com/')).to eq 'farmdrop.com'
      end

      it 'generates a short url' do
        expect(dummy_class.generate_url).not_to be_empty
        expect(dummy_class.generate_url).to match(%r{/[[:alnum:]]+})
      end

end