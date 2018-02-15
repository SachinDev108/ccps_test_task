FactoryGirl.define do
  factory :customer do
    name 'Guest'
    surname  'User'
    customer_number SecureRandom.hex(10)
  end
end