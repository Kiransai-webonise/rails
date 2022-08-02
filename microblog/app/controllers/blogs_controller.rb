class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.create(blog_params)

    redirect_to :action => 'index'
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)

    redirect_to :action => 'index'
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to :action => 'index'
  end

  def change_status
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :status)
  end
end
