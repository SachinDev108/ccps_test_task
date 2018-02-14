module Api
  module V1
    class SalesController < ApiController

      def index
        render json: Sale.all
      end

      def create
        sale = customer.create_sale(sale_params)
        if sale.save
          render json: sale, status: 200
        else
          render json: sale.errors, status: 422
        end
      end

      private

      def sale_params
        expected_parameter_type(:sale)
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
        Customer.find_or_initialize_by(customer_params)
      end

    end
  end
end    
