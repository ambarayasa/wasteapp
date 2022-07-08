class Waste < ApplicationRecord
    has_many :transaction_details
    has_many :transactions, through: :transaction_details
    belongs_to :category
end
