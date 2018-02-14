# spec/integrations/sale_spec.rb

require 'swagger_helper'

describe 'CCPS API' do

  path '/sales' do

    post 'Creates a sale to a customer' do
      tags 'CCPS'
      consumes 'application/json'
      parameter name: :data, in: :body, schema: {
          type: :object,
          properties: {
            type: { type: :string },
            attributes: {
              type: :object,
              properties: {
                item: { type: :string },
                date_of_transaction: { type: :string },
                source: { type: :string },
                price: { type: :string }
              }
            },
            relationships: {
              type: :object,
              properties: {
                customer: {
                  type: :object,
                  properties: {
                    data: {
                      type: :object,
                      properties: {
                        customer_number: { type: :string, 'x-nulllable': true },
                        name: { type: :string, 'x-nulllable': true },
                        surname: { type: :string,'x-nulllable': true },
                      }
                    }
                  }
                }
              }
            }
          }
      }
      response '201', 'sales created' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['title']).to eq('foo')
        end
        context 'return a valid 201 response ' do
          it 'creates sales for new customer' do ||

          end

          it 'creates sales for existing customer' do |example|
            byebug
          end
        end

      end
    end
  end
end