class Blog < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { minimum: 3, maximum: 10 }
    validates :body, presence: true
    validates :status, presence: true
    enum :status, { inactive: 0, active: 1 }
end
