module Api
  module V1
    class PurchaseHistoriesController < ApiController
      before_action :check_parameter_type

      def index
        render json: PurchaseHistories.all
      end

      def create
        purchase_history = create_customer.purchase_histories.new(sales_params)
        if purchase_history.save
          render json: purchase_history, status: 200
        else
          render json: purchase_history.errors, status: 422
        end
      end

      private

      def check_parameter_type
        expected_parameter_type(:purchase_history)
      end  

      def sales_params
        expected_parameter_type(:purchase_history)
        params.require(:attributes).permit(
          :item, :source, :price, :date_of_transaction
        )
      end

      def customer_params
        params.require(:relationships).require(:customer).require(:data)
      end

      def create_customer
        
        customer = Customer.where(customer_number: customer_params[:customer_number])
          .first_or_initialize
        if customer && !customer.errors.any?
          customer.name = customer_params[:name]
          customer.surname = customer_params[:surname]
          render json: customer.errors, status: 422 unless customer.save
        else
          render json: 'error', status: 'not found'
        end 
        customer    
      end 
    end
  end
end    
