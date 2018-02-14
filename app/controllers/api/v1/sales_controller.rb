module Api
  module V1
    class SalesController < ApiController
      
      def index
        render json: Sale.all
      end

      def create
        sale = customer.create_sale(req_params)
        if sale.save
          render json: sale, status: 200
        else
          render json: sale.errors, status: 422
        end
      end

      private

      def req_params
        expected_parameter_type(:sale)
        permitted_params = {
          sale: [:item, :source, :price, :date_of_transaction],
          customer: [:customer_number, :name, :surname]
        }
        parse_params permitted_params
      end

      def customer
        Customer.find_or_initialize_by(customer_number: req_params[:customer][:customer_number])
      end
    end
  end
end    
