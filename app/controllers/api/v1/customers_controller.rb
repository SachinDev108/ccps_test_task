# frozen_string_literal: true

module Api
  module V1
    class CustomersController < ApiController # :nodoc:
      def index
        render json: Customer.all
      end
    end
  end
end
