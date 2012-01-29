Gem::Specification.new do |s|
  s.name        = 'ean3'
  s.version     = '0.0.4'
  s.date        = '2012-01-29'
  s.summary     = "ean of plugin"
  s.description = "http://developer.ean.com/docs/read/hotels/Version_3"
  s.authors     = ["Toshiaki Takahashi"]
  s.email       = 'toshipon123@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/ean3'
  s.add_dependency('faraday', '~> 0.7.5')
  s.add_dependency('faraday_middleware', '>= 0.6', '< 0.8')
  s.add_dependency('hashie', '~> 1.0')
  s.add_dependency('log4r')
end
