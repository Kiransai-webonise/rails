Blogtype::TypeBlogsController.class_eval do
    after_action :allow_iframe, only: :lookup
    def edit
        render 'blogs/edit_blog_type'
    end
end
