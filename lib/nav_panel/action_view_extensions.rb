module NavPanel
  module ActionViewExtensions

    # Render the nav-panel container markup scaffolding.
    def nav_panel
      content_tag :div, :class => 'nav-panel' do
        concat content_tag :ul,  content_for(:nav_panel_global),   :class => 'nav-panel-global button-list'
        concat content_tag :ul,  content_for(:nav_panel_local),    :class => 'nav-panel-local button-list'
        concat content_tag :div, content_for(:nav_panel_message),  :class => 'nav-panel-message'
      end
    end

    # Should create a new link wrapped in an <li> tag with
    # the class 'nav-panel-button' applied to the <a> tag that
    # will be inserted into the nav-panel's local list <ul>.
    def local_nav_panel_link_to(label, url, html_options = {})
      content_for :nav_panel_local, nav_panel_link_to(label, url, html_options)
    end

    # Should create a new link wrapped in an <li> tag with
    # the class 'nav-panel-button' applied to the <a> tag that
    # will be inserted into the nav-panel's global list <ul>.
    def global_nav_panel_link_to(label, url, html_options = {})
      content_for :nav_panel_global, nav_panel_link_to(label, url, html_options)
    end

    # Should set a new admin-nav message that overrides any 
    # previously stored message using :flush => true.
    def set_nav_panel_message(message)
      content_for :nav_panel_message, :flush => true do
        message
      end
    end


    private

    # Create an admin link wrapped in an <li>.
    def nav_panel_link_to(label, url, html_options = {})
      html_options = insert_nav_panel_button_class_to(html_options)
      
      content_tag :li, link_to(label, url, html_options)
    end

    # Apply the 'admin-button' class to the html_options hash and return it.
    def insert_nav_panel_button_class_to(html_options)
      if html_options.has_key? :class
        html_options[:class].concat(' nav-panel-button')
      else
        html_options[:class] = 'nav-panel-button'
      end

      html_options
    end

  end
end

ActionView::Base.send :include, NavPanel::ActionViewExtensions
