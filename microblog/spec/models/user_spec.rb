require "rails_helper"

RSpec.describe "User signs in" do
    before do
        @user = create :user
        visit('/users/sign_in')
    end

    it "valid with correct credentials" do
        fill_in "user_email", with: @user.email
        fill_in "user_password", with: @user.password
        click_button "Log in"

        expect(page).to have_text "Add New Blog"
    end

    scenario "invalid with unregistered account" do
        fill_in "user_email", with: Faker::Internet.email
        fill_in "user_password", with: "FakePassword123"
        click_button "Log in"

        expect(page).to have_no_text "Add New Blog"
        expect(page).to have_text "Log in"
    end

    scenario "invalid with invalid password" do
        fill_in "user_email", with: @user.email
        fill_in "user_password", with: "FakePassword123"
        click_button "Log in"

        expect(page).to have_no_text "Add New Blog"
        expect(page).to have_text "Log in"
    end
end

RSpec.describe "User signs up" do
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password(min_length: 8) }

    before do
        visit('/users/sign_up')
    end

    it "with valid data" do
        fill_in "user_email", with: email
        fill_in "user_password", with: password
        fill_in "user_password_confirmation", with: password

        click_button "Sign up"
        expect(page).to have_text "Add New Blog"
    end

    it "invalid when email already exists" do
        user = create :user

        fill_in "user_email", with: user.email
        fill_in "user_password", with: password
        fill_in "user_password_confirmation", with: password
        click_button "Sign up"

        expect(page).to have_no_text "Add New Blog"
        expect(page).to have_text "Sign up"
    end

    it "different password and confirm password" do
        fill_in "user_email", with: email
        fill_in "user_password", with: password
        fill_in "user_password_confirmation", with: 'FakePassword123'

        click_button "Sign up"

        expect(page).to have_no_text "Add New Blog"
        expect(page).to have_text "Sign up"
    end
end
