$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'nav_panel/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nav_panel"
  s.version     = NavPanel::VERSION
  s.authors     = ["Rob McLarty"]
  s.email       = ["rob.mclarty@gmail.com"]
  s.homepage    = "https://github.com/robmclarty/nav_panel"
  s.summary     = %q{A simple navigation panel for your Rails app.}
  s.description = %q{Applies a navigation bar at the top of your website in which you can insert any links you need, rendered as pretty buttons with icons.}

  s.files = Dir["{vendor,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '>= 3.1', '< 5.0'

  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'turn', '~> 0.9.6'
end
