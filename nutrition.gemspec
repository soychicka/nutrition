$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nutrition/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nutrition"
  s.version     = Nutrition::VERSION
  s.authors     = ["soychicka"]
  s.email       = ["soychicka@gmail.com"]
  s.homepage    = ""
  s.summary     = "rails engine to allow easy integration of USDA Nutrition data into rails app."
  s.description = "National Nutrient Database for Standard Reference Release 28.  Refer to enclosed pdf for data licensing info."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 4.2.4"

  s.add_development_dependency "sqlite3"
end
