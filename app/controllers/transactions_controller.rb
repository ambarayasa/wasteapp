class TransactionsController < ApplicationController
    before_action :set_transaction, only: %i[ show update destroy ]

    def index
        @transactions = Transaction.all
        @respond = []

        @transactions.each do |transaction|
            @respond << {
                transaction: transaction,
                details: transaction.transaction_details
            }
        end

        render json: {
            transactions: @respond
        }
    end

    def create
        @transaction = Transaction.new(transaction_params)
        @transaction.add_waste(waste_transaction_params[:wastes])
        @transaction.add_subtotal
        @transaction.add_total_price
        @transaction.save

        if @transaction.save
            render json: {
              status: "true",
              code: 200,
              message: "Sucessfully added data",
              data: @transaction
            }
        else
            render json: {
              status: "false",
              code: 404,
              message: "Failed to add data"
            }
        end
    end

    def update
        @transaction.update(transaction_params)
        
        if @transaction.update(transaction_params)
            render json: {
              status: "true",
              code: 200,
              message: "Sucessfully updated data",
              data: @transaction
            }
        else
            render json: {
              status: "false",
              code: 404,
              message: "Failed to update data"
            }
        end
    end

    def show
        @transaction_detail = @transaction.transaction_details
        render json: {
            transaction: @transaction_detail,
            waste: @transaction.wastes
        }
    end

    def destroy
        @transaction.transaction_details.destroy_all
        @transaction.destroy

        if @transaction.destroy
            render json: {
              status: "true",
              code: 200,
              message: "Sucessfully deleted data",
            }
          else
            render json: {
              status: "false",
              code: 404,
              message: "Failed to delete data"
            }
        end
    end

    private
    def transaction_params
        params.require(:transaction).permit(:user_id, :depot_id, :date, :descriptions)
    end

    def waste_transaction_params
        params.require(:transaction).permit(wastes: [:id, :quantity])
    end

    def set_transaction
        @transaction = Transaction.find_by(id: params[:id])
    end
end
