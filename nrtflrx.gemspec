Gem::Specification.new do |s|
  s.name          = 'nrtflrx'
  s.summary       = 'Ruby gem for the Netflix API'
  s.authors       = ['Dave Jachimiak']
  s.email         = 'dave.jachimiak@gmail.com'
  s.homepage      = 'http://github.com/davejachimiak'
  s.version       = '0.0.1'
  s.files         = `git ls-files`.split("\n").reject do |file_name|
    /\.gem$/.match file_name
  end
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY

  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")

  s.add_development_dependency 'rake', '0.9.2.2'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'minitest'
end
