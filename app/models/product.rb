class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :rating, presence: true
    validates :featured_photo, presence: true

    has_and_belongs_to_many :carts
end
