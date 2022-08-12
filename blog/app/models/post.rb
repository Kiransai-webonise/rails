class Post
  include Mongoid::Document
  field :title, type: String
  field :body, type: String
  field :status, type: String
end
