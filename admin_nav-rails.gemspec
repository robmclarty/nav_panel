$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'admin_nav/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_nav-rails"
  s.version     = AdminNav::Rails::VERSION
  s.authors     = ["Rob McLarty"]
  s.email       = ["rob.mclarty@gmail.com"]
  s.homepage    = "https://github.com/robmclarty/admin_nav-rails"
  s.summary     = %q{A simple admin navigation bar for your Rails app.}
  s.description = %q{Applies a navigation bar at the top of your website in which you can insert any administration actions you need as buttons.}

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.13'

  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'capybara', '~> 2.1.0'
  #s.add_development_dependency 'mocha', '~> 0.14.0'
  s.add_development_dependency 'turn', '~> 0.9.6'
end
