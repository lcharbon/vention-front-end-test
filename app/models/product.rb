class Product < ApplicationRecord
    after_create_commit {

    }
    has_and_belongs_to_many :carts
end
