Gem::Specification.new do |s|
  s.name          = 'nrtflrx'
  s.summary       = 'Ruby gem for the Netflix API'
  s.authors       = ['Dave Jachimiak']
  s.email         = 'dave.jachimiak@gmail.com'
  s.homepage      = 'http://github.com/davejachimiak'
  s.version       = '0.0.1'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY

  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")

  s.add_development_dependency 'rake', '0.9.2'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'mocha', require: false
  s.add_development_dependency 'turn', require: false
  s.add_development_dependency 'minitest'
end
