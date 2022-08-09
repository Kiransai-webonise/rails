module Blogtype
  class TypeBlogsController < ApplicationController
    before_action :set_type_blog, only: %i[ show edit update destroy ]

    def index
      @type_blogs = TypeBlog.all
    end

    def new
      @type_blog = TypeBlog.new
    end

    def edit
    end

    def create
      @type_blog = TypeBlog.new(type_blog_params)

      if @type_blog.save
        redirect_to @type_blog, notice: "Blog type was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @type_blog.update(type_blog_params)
        redirect_to @type_blog, notice: "Blog type was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @type_blog.destroy
      redirect_to type_blogs_url, notice: "Blog type was successfully destroyed."
    end

    private

      def set_type_blog
        @type_blog = TypeBlog.find(params[:id])
      end

      def type_blog_params
        params.require(:type_blog).permit(:blog_type, :description)
      end
  end
end
