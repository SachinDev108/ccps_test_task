# spec/integrations/sale_spec.rb

require 'swagger_helper'

describe 'CCPS API' do

  path '/customers' do

    get 'List of customers' do
      tags 'CCPS'
      consumes 'application/json'
      response '201', 'List of customers' do
        run_test!
      end
    end
  end
end