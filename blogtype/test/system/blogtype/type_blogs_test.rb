require "application_system_test_case"

module Blogtype
  class TypeBlogsTest < ApplicationSystemTestCase
    setup do
      @type_blog = blogtype_type_blogs(:one)
    end

    test "visiting the index" do
      visit type_blogs_url
      assert_selector "h1", text: "Type blogs"
    end

    test "should create type blog" do
      visit type_blogs_url
      click_on "New type blog"

      fill_in "Blog type", with: @type_blog.blog_type
      fill_in "Description", with: @type_blog.description
      click_on "Create Type blog"

      assert_text "Type blog was successfully created"
      click_on "Back"
    end

    test "should update Type blog" do
      visit type_blog_url(@type_blog)
      click_on "Edit this type blog", match: :first

      fill_in "Blog type", with: @type_blog.blog_type
      fill_in "Description", with: @type_blog.description
      click_on "Update Type blog"

      assert_text "Type blog was successfully updated"
      click_on "Back"
    end

    test "should destroy Type blog" do
      visit type_blog_url(@type_blog)
      click_on "Destroy this type blog", match: :first

      assert_text "Type blog was successfully destroyed"
    end
  end
end
