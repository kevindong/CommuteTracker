require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links as logged out user" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", users_path, false
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title("Sign up")
  end
  
  test "layout links as logged in user" do
    log_in_as(users(:michael))
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", users_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title("Sign up")
  end
end
