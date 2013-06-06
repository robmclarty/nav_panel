module AdminNav
  module Rails
    module ActionViewExtensions
      
    end
  end
end

ActionView::Base.send :include, AdminNav::Rails::ActionViewExtensions
