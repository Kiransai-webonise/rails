require 'rails_helper'

RSpec.describe Blog, :type => :model do
    let(:status_values) do
        { inactive: 0, active: 1 }
    end

    before(:all) do
        @blog = build(:blog)
    end 

    it "has title" do
        blog = Blog.new(title: "").save
        expect(blog).to eq(false)
    end
    
    it "has title with more than 2 characters" do
        blog = Blog.new(title: "as").save
        expect(blog).to eq(false)
    end

    it "has title with max of 10 characters" do
        blog = Blog.new(title: "kirzn sai b title").save
        expect(blog).to eq(false)
    end

    it "has valid title in factory" do
        expect(@blog).to be_valid
    end

    it "has status" do
        blog = Blog.new(status: "").save
        expect(blog).to eq(false)
    end

    it "has valid status" do
        expect(@blog).to be_valid
    end

    it "has body" do
        blog = Blog.new(body: "").save
        expect(blog).to eq(false)
    end

    it "has valid body" do
        expect(@blog).to be_valid
    end
end