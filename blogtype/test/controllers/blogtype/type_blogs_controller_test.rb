require "test_helper"

module Blogtype
  class TypeBlogsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @type_blog = blogtype_type_blogs(:one)
    end

    test "should get index" do
      get type_blogs_url
      assert_response :success
    end

    test "should get new" do
      get new_type_blog_url
      assert_response :success
    end

    test "should create type_blog" do
      assert_difference("TypeBlog.count") do
        post type_blogs_url, params: { type_blog: { blog_type: @type_blog.blog_type, description: @type_blog.description } }
      end

      assert_redirected_to type_blog_url(TypeBlog.last)
    end

    test "should show type_blog" do
      get type_blog_url(@type_blog)
      assert_response :success
    end

    test "should get edit" do
      get edit_type_blog_url(@type_blog)
      assert_response :success
    end

    test "should update type_blog" do
      patch type_blog_url(@type_blog), params: { type_blog: { blog_type: @type_blog.blog_type, description: @type_blog.description } }
      assert_redirected_to type_blog_url(@type_blog)
    end

    test "should destroy type_blog" do
      assert_difference("TypeBlog.count", -1) do
        delete type_blog_url(@type_blog)
      end

      assert_redirected_to type_blogs_url
    end
  end
end
