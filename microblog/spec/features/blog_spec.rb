require 'rails_helper'

RSpec.describe 'Blogs features' do
    let(:view_blogs) do
        visit('/blogs')
    end

    let(:create_blog) do
        Blog.create!(title: 'kiran', body: 'good', publish: 1)
        view_blogs
    end

    describe 'viewing the index' do
        it 'lists all of the blogs' do
            create_blog

            expect(page).to have_content('kiran')
            expect(page).to have_content('good')
        end
    end

    describe 'adding a new blog' do
        it 'adds the blog to the list of blogs' do
            view_blogs
            click_link('Ad New Blog')

            expect(current_path).to have_content('/blogs/new')

            fill_in(placeholder: "Title", with: 'kiran')
            fill_in(placeholder: "Body", with: 'good')
            select "No", from: "blog[publish]"

            click_button('Create Blog')

            expect(current_path).to have_content('/blogs')
            expect(page).to have_content('kiran')
        end
    end

    describe 'editing a blog' do
        it 'edit the blog in the list of blogs' do
            create_blog

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
        it 'delete the blog in the list of blogs' do
            create_blog

            expect(page).to have_content('good')
            click_button('Delete')
            expect(current_path).to have_content('/blogs')
            expect(page).to have_no_content('good')
        end
    end

    describe 'Change Status' do
        it 'Change the status the blog in the list of blogs' do
            create_blog

            expect(find_field('blog[publish]').find('option[selected]').text).to eq('Yes')
            select "No", from: "blog[publish]"

            expect(find_field('blog[publish]').find('option[selected]').text).to eq('No')
        end
    end
end
