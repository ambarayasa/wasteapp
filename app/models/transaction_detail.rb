class TransactionDetail < ApplicationRecord
    belongs_to :waste_transaction, class_name: "Transaction", foreign_key: "transaction_id", required: false
    belongs_to :waste, required: false

    validates :quantity, presence: true
    validates :subtotal, presence: true
    validates :unit_price, presence: true

    def add_subtotal
        self.subtotal = self.unit_price * self.quantity
    end
end
