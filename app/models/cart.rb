class Cart < ApplicationRecord
    has_and_belongs_to_many :products

    def add_product product
        products << product
    end

    def remove_product product
        products.delete product
    end
end
