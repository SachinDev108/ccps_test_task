module Api
  module V1
    class PurchaseHistoriesController < ApiController

      def index
        render json: PurchaseHistories.all
      end

      def create
        purchase_history = customer.create_sale(sale_params)
        if purchase_history.save
          render json: purchase_history, status: 200
        else
          render json: purchase_history.errors, status: 422
        end
      end

      private

      def sale_params
        expected_parameter_type(:purchase_history)
        params.require(:attributes).permit(
          :item, :source, :price, :date_of_transaction, :customer
        )
      end

      def customer_params
        params.require(:relationships).require(:customer).require(:data).permit(
          :customer_number, :name, :surname
        )
      end

      def customer
        byebug
        Customer.find_or_initialize_by(customer_params)
      end

    end
  end
end    
