require 'rails_helper'

RSpec.describe Blog, :type => :model do
    before(:all) do
        @blog = build(:blog)
    end 

    it "has title" do
        blog = Blog.new({title: "", body: "ggg", publish: 1}).save
        expect(blog).to eq(false)
    end
    
    it "has title with more than 2 characters" do
        blog = Blog.new({title: "as", body: "ggg", publish: 1}).save
        expect(blog).to eq(false)
    end

    it "has title with max of 10 characters" do
        blog = Blog.new({title: "kirzn sai b title", body: "ggg", publish: 1}).save
        expect(blog).to eq(false)
    end

    it "has valid title in factory" do
        expect(@blog).to be_valid
    end

    it "has published" do
        blog = Blog.new({title: "kirzn", body: "ggg", publish: ""}).save
        expect(blog).to eq(false)
    end

    it "has valid publish in factory" do
        expect(@blog).to be_valid
    end

    it "has body" do
        blog = Blog.new({title: "kirzn", body: "", publish: 1}).save
        expect(blog).to eq(false)
    end

    it "has valid body in factory" do
        expect(@blog).to be_valid
    end
end
