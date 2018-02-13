module Api
  module V1
    class CustomersController < ApiController
      def index
        render json: Customer.all
      end
    end
  end
end