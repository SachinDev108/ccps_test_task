FactoryGirl.define do
  factory :sale do
    item 'Test Item'
    price  '25'
    source 'mobile'
    date_of_transaction '2018-01-11T11:34+01:00'
    user { create(:user) }
  end
end