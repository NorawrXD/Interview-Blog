class BlogPost < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :title, length: { maximum: 100 }
    validates :body, length: { maximum: 5000 }
end
