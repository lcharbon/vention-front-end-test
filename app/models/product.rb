class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :rating, presence: true

    has_and_belongs_to_many :carts
    has_one_attached :feature_image
end
