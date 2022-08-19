require 'rails_helper'

RSpec.describe Blog, :type => :model do
    let(:status_values) do
        { inactive: 0, active: 1 }
    end

    before(:all) do
        @blog = build(:blog)
    end 
    
    it "has valid title" do
        expect(@blog).to be_valid
    end

    it "has valid status" do
        expect(@blog).to be_valid
    end

    it "has valid body" do
        expect(@blog).to be_valid
    end

    # it "updates status" do
    #     blog_status = Blog.new(status: 0)
  
    #     expect do 
    #         blog_status.toggle_property(:completed)
    #     end.to change {blog_status.completed}.from(true).to(false)
    #   end
    # end
end