# NOTE: Currently using Engine method instead, but keeping this for reference for now.
require 'admin_nav/rails/action_view_extensions'

module AdminNav
  module Rails
    class Railtie < Rails::Railtie
      initializer 'admin_nav.rails.action_view_extensions' do
        ActionView::Base.send :include, ActionViewExtensions
      end
    end
  end
end