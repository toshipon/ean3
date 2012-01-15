require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'
require 'fakeweb'
require 'json'
require 'hashie'

#require 'log4r'
#require 'log4r/configurator'

#formatter = Log4r::PatternFormatter.new(
#  :pattern => "%d %C [%l]: %M",
#  :date_format => "%Y/%m/%d %H:%M:%S"
#)
#outputter = Log4r::StdoutOutputter.new(STDOUT, :formatter => formatter)
#logger = Log4r::Logger.new("ean")
#logger.add(outputter)
#config.logger = logger

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'ean3'
require 'config'

FakeWeb.allow_net_connect = true

def ean_test_client
  options = {}
  options[:apikey] = APIKEY # from config.rb
  options[:secret] = SECRET
  options[:minorRev] = 12
  options[:debug] = true
  options[:locale] = "ja_JP"
  options[:currencyCode] = "JPY"
  Ean3::Client.new(options)
end

def ean_url(url)
  url =~ /^http/ ? url : "http://api.ean.com/ean-services/rs/hotel/v3/#{url}"
end

def fixture_file(filename, options={})
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  fixture = File.read(file_path)

  case File.extname(file_path)
  when '.json'
    options[:parse] ? Hashie::Mash.new(JSON.parse(fixture)) : fixture
  else
    fixture
  end
end

def stub_get(url, filename, options={})
  opts = {
    :body => fixture_file(filename),
    :content_type => 'application/json; charset=utf-8'
  }.merge(options)
  FakeWeb.register_uri(:get, ean_url(url), opts)
end
