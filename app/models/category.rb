class Category < ApplicationRecord
    has_many :wastes

    validates :name, presence: true
end
