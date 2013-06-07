module AdminNav
  module ActionViewExtensions

    # Render the admin-nav container markup scaffolding.
    def admin_nav
      content_tag :div, :class => 'admin-nav' do
        concat content_tag :ul,  content_for(:admin_nav_global),   :class => 'admin-nav-global.button-list'
        concat content_tag :ul,  content_for(:admin_nav_local),    :class => 'admin-nav-local.button-list'
        concat content_tag :div, content_for(:admin_nav_message),  :class => 'admin-nav-message'
      end
    end

    # Should create a new link wrapped in an <li> tag with
    # the class 'admin-button' applied to the <a> tag that
    # will be inserted into the admin-nav's local list <ul>.
    def local_admin_link_to(label, url, html_options = {})
      content_for :admin_nav_local, admin_link_to(label, url, html_options)
    end

    # Should create a new link wrapped in an <li> tag with
    # the class 'admin-button' applied to the <a> tag that
    # will be inserted into the admin-nav's global list <ul>.
    def global_admin_link_to(label, url, html_options = {})
      content_for :admin_nav_global, admin_link_to(label, url, html_options)
    end

    # Should set a new admin-nav message that overrides any 
    # previously stored message using :flush => true.
    def set_admin_message(message)
      content_for :admin_nav_message, :flush => true do
        message
      end
    end


    private

    # Create an admin link wrapped in an <li>.
    def admin_link_to(label, url, html_options = {})
      html_options = insert_admin_button_class_to(html_options)
      
      content_tag :li, link_to(label, url, html_options)
    end

    # Apply the 'admin-button' class to the html_options hash and return it.
    def insert_admin_button_class_to(html_options)
      if html_options.has_key? :class
        html_options[:class].concat(' admin-button')
      else
        html_options[:class] = 'admin-button'
      end

      html_options
    end

  end
end

ActionView::Base.send :include, AdminNav::ActionViewExtensions
