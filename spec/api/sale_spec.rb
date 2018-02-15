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
      response '422', 'validation error' do
        context 'return error when source is different' do
          let(:params) {
          {
             "type": "sale",
             "attributes": {
               "item": "test",
               "source": "pos",
               "price": "12",
               "date_of_transaction": "2015-06-11T11:34+01:00"
             },
             "relationships": {
               "customer": {
                 "data": {
                   "customer_number": "1223",
                   "name": "test",
                   "surname": "user"
                 }
               }
             }
            }
          }
          it 'retrun 422 with message' do
            post '/api/v1/sales', params: params
            body = JSON.parse(response.body)
            expect(response.success?).to eq false
            expect(response.status).to eq(422)
          end   
        end 
        context 'return error when attributes blank' do
          let(:params) {
          {
             "type": "sale",
             "attributes": {
               "item": "",
               "source": "",
               "price": "",
               "date_of_transaction": ""
             },
             "relationships": {
               "customer": {
                 "data": {
                   "customer_number": "1223",
                   "name": "test",
                   "surname": "user"
                 }
               }
             }
            }
          }
          it 'retrun 422 with message' do
            post '/api/v1/sales', params: params
            body = JSON.parse(response.body)
            expect(response.success?).to eq false
            expect(response.status).to eq(422)
          end   
        end

        context 'return error when relationships attributes blank' do
          let(:params) {
          {
             "type": "sale",
             "attributes": {
               "item": "test",
               "source": "mobile",
               "price": "12",
               "date_of_transaction": "2015-06-11T11:34+01:00"
             },
             "relationships": {
               "customer": {
                 "data": {
                   "customer_number": "",
                   "name": "",
                   "surname": ""
                 }
               }
             }
            }
          }
          it 'retrun 422 with message' do
            post '/api/v1/sales', params: params
            body = JSON.parse(response.body)
            expect(response.success?).to eq false
            expect(response.status).to eq(422)
          end   
        end  
      end
      response '201', 'sales created' do
        let(:params) {
        {
           "type": "sale",
           "attributes": {
             "item": "test",
             "source": "mobile",
             "price": "12",
             "date_of_transaction": "2015-06-11T11:34+01:00"
           },
           "relationships": {
             "customer": {
               "data": {
                 "customer_number": "1223",
                 "name": "test",
                 "surname": "user"
               }
             }
           }
          }
        }
        context 'with new customer' do
          it 'creates sales for new customer' do
            post '/api/v1/sales', params: params
            expect(response.success?).to eq true
            expect(response.status).to eq(200)
            expect(Customer.count).to eq(1)
          end
        end

        context 'with existing customer' do
          let!(:customer) { create(:customer) }
          let(:params) {
          {
             "type": "sale",
             "attributes": {
               "item": "test",
               "source": "mobile",
               "price": "12",
               "date_of_transaction": "2015-06-11T11:34+01:00"
             },
             "relationships": {
               "customer": {
                 "data": {
                   "customer_number": customer.customer_number,
                   "name": "test",
                   "surname": "user"
                 }
               }
             }
            }
          }
          it 'creates sales for existing customer' do
            customer = create(:customer)
            post '/api/v1/sales', params: params
            body = JSON.parse(response.body)
            expect(response.success?).to eq true
            expect(response.status).to eq(200)
            expect(body['customer']['id']).to eq(customer.id)
          end
        end
      end
    end
  end
end