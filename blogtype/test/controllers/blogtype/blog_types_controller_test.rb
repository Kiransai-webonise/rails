require "test_helper"

module Blogtype
  class BlogTypesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @blog_type = blogtype_blog_types(:one)
    end

    test "should get index" do
      get blog_types_url
      assert_response :success
    end

    test "should get new" do
      get new_blog_type_url
      assert_response :success
    end

    test "should create blog_type" do
      assert_difference("BlogType.count") do
        post blog_types_url, params: { blog_type: { description: @blog_type.description, type: @blog_type.type } }
      end

      assert_redirected_to blog_type_url(BlogType.last)
    end

    test "should show blog_type" do
      get blog_type_url(@blog_type)
      assert_response :success
    end

    test "should get edit" do
      get edit_blog_type_url(@blog_type)
      assert_response :success
    end

    test "should update blog_type" do
      patch blog_type_url(@blog_type), params: { blog_type: { description: @blog_type.description, type: @blog_type.type } }
      assert_redirected_to blog_type_url(@blog_type)
    end

    test "should destroy blog_type" do
      assert_difference("BlogType.count", -1) do
        delete blog_type_url(@blog_type)
      end

      assert_redirected_to blog_types_url
    end
  end
end
