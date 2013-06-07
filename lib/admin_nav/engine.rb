#require 'rails/engine'
#require 'rails'

module AdminNav
  class Engine < ::Rails::Engine
  end
  # if defined? ::Rails::Engine
  #   class Engine < ::Rails::Engine
  #     # add_paths_block = lambda { |app|
  #     #   app.config.assets.paths << File.expand_path("../../../vendor/assets/images", __FILE__)
  #     #   app.config.assets.paths << File.expand_path("../../../vendor/assets/stylesheets", __FILE__)
  #     # }
  #   end
  # elsif defined? ::Sprockets
  #   ::Sprockets.append_path File.join(root_dir, "lib", "assets", "images")
  #   ::Sprockets.append_path File.join(root_dir, "lib", "assets", "stylesheets")
  # end
end