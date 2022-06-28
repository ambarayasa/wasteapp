class Depot < ApplicationRecord
    has_many :transactions

    validates :name, presence: true
    validates :address, presence: true
end
