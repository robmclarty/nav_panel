require 'test_helper'

class ActionViewExtensionsTest < ActiveSupport::TestCase
  include AdminNav::ActionViewExtensions
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Context

  def setup
    @sample_link_label = 'Label'
    @sample_link_url = 'http://somewhere.com'
  end

  test "insert_admin_button_class_to adds admin-button class if no existing classes" do
    result = insert_admin_button_class_to({})
    
    assert_equal({ :class => "admin-button" }, result)
  end

  test "insert_admin_button_class_to concats admin-button class if already existing classes" do
    result = insert_admin_button_class_to({ :class => 'existing-class' })
    
    assert_equal({ :class => "existing-class admin-button" }, result)
  end

  test "admin_link_to returns link wrapped in <li> tag" do
    expected_link = content_tag :li, link_to(@sample_link_label, @sample_link_url, :class => 'admin-button')
    result = admin_link_to(@sample_link_label, @sample_link_url)

    assert_match expected_link, result
  end

  # TODO: Not sure how to test `content_for` in helper method.
  # Keep getting `undefined method `append' for nil:NilClass`.
  # This issue affects all the rest of these tests...

  # test "admin_nav creates div with class admin-panel" do
  #   content_for :admin_nav_global, "something"
  #   content_for :admin_nav_local, "something"
  #   content_for :admin_nav_message, "something"
  #
  #   assert_match /class="admin-nav"/, admin_nav
  # end

  # test "admin_nav contains <ul> with class admin-nav-global" do
  #   flunk 'Not done testing yet.'
  # end

  # test "admin_nav contains <ul> with class admin-nav-local" do
  #   flunk 'Not done testing yet.'
  # end

  # test "admin_nav contains <div> with class admin-nav-message" do
  #   flunk 'Not done testing yet.'
  # end

  # test "set_admin_message inserts new message while destroying previous message" do
  #   flunk 'Not done testing yet.'
  # end

  # test "local_admin_link_to inserts a new li-wrapped link into admin-nav-local" do
  #   flunk 'Not done testing yet.'
  # end

  # test "global_admin_link_to inserts a new li-wrapped link into admin-nav-global" do
  #   flunk 'Not done testing yet.'
  # end

end