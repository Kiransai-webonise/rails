require "application_system_test_case"

module Blogtype
  class BlogTypesTest < ApplicationSystemTestCase
    setup do
      @blog_type = blogtype_blog_types(:one)
    end

    test "visiting the index" do
      visit blog_types_url
      assert_selector "h1", text: "Blog types"
    end

    test "should create blog type" do
      visit blog_types_url
      click_on "New blog type"

      fill_in "Description", with: @blog_type.description
      fill_in "Type", with: @blog_type.type
      click_on "Create Blog type"

      assert_text "Blog type was successfully created"
      click_on "Back"
    end

    test "should update Blog type" do
      visit blog_type_url(@blog_type)
      click_on "Edit this blog type", match: :first

      fill_in "Description", with: @blog_type.description
      fill_in "Type", with: @blog_type.type
      click_on "Update Blog type"

      assert_text "Blog type was successfully updated"
      click_on "Back"
    end

    test "should destroy Blog type" do
      visit blog_type_url(@blog_type)
      click_on "Destroy this blog type", match: :first

      assert_text "Blog type was successfully destroyed"
    end
  end
end
