class Transaction < ApplicationRecord
    has_many :transaction_details
    has_many :wastes, through: :transaction_details
    belongs_to :user
    belongs_to :depot


    def add_waste(wastes)
        wastes.each do |waste|
            if Waste.find_by_id(waste[:id]).present?
                self.transaction_details << TransactionDetail.new(waste_id: waste[:id], quantity: waste[:quantity], unit_price: Waste.find_by_id(waste[:id]).price)
            else
                self.errors.add(:waste, "not exist")
            end
        end
    end

    def add_subtotal
        self.transaction_details.each do |transaction_detail|
            transaction_detail.add_subtotal
        end
    end

    def add_total_price
        self.transaction_details.each do |transaction_detail|
            self.total = self.total + transaction_detail.subtotal
        end
    end
end
