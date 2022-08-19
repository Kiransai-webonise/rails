require 'rails_helper'

RSpec.describe 'Blogs features' do
    let(:view_blogs) do
        visit('/blogs')
    end

    describe 'viewing the index' do
        it 'lists all of the blogs' do
            Blog.create!(title: 'kiran', body: 'good', status: 1)

            view_blogs

            expect(page).to have_content('kiran')
            expect(page).to have_content('good')
        end
    end

    describe 'adding a new blog' do
        it 'adds the blog to the list of blogs' do
            view_blogs
            click_link('Add New Blog')

            expect(current_path).to have_content('/blogs/new')

            fill_in(placeholder: "Title", with: 'kiran')
            fill_in(placeholder: "Body", with: 'good')
            select "Unpublish", from: "blog[status]"

            click_button('Create Blog')

            expect(current_path).to have_content('/blogs')
            expect(page).to have_content('kiran')
        end
    end

    describe 'editing a blog' do
        it 'edit the blog in the list of blogs' do
            Blog.create!(title: 'kiran', body: 'good', status: 1)

            view_blogs

            click_link('Edit')
            expect(page).to have_content('good')

            fill_in(placeholder: "Title", with: 'kiran')
            fill_in(placeholder: "Body", with: 'bad')

            click_button('Update Blog')

            expect(current_path).to have_content('/blogs')
            expect(page).to have_content('bad')
        end
    end

    describe 'Deleting a blog' do
        it 'edit the blog in the list of blogs' do
            Blog.create!(title: 'kiran', body: 'good', status: 1)

            view_blogs

            expect(page).to have_content('good')
            click_button('Delete')
            expect(current_path).to have_content('/blogs')
            expect(page).to have_no_content('good')
        end
    end
end