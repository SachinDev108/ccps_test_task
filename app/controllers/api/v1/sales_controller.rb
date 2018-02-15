# frozen_string_literal: true

module Api
  module V1
    class SalesController < ApiController # :nodoc:
      def index
        render json: Sale.all
      end

      def create
        customer = generate_customer
        if customer.errors.any?
          render json: customer.errors, status: 422
        else
          sale = customer.sales.create(req_params[:sale])
          render_response(sale)
        end
      end

      private

      def req_params
        expected_parameter_type(:sale)
        permitted_params = {
          sale: %i[item source price date_of_transaction],
          customer: %i[customer_number name surname]
        }
        parse_params permitted_params
      end

      def unique_id
        uuid = req_params[:customer][:customer_number]
        uuid.present? ? uuid : SecureRandom.hex(10)
      end

      def render_response(sale)
        if sale.save
          render json: sale, status: 200
        else
          render json: sale.errors, status: 422
        end
      end

      def generate_customer
        customer = Customer.find_or_initialize_by(customer_number: unique_id)
        if customer.new_record?
          customer = customer.create_customer(req_params[:customer])
        end
        customer
      end
    end
  end
end
