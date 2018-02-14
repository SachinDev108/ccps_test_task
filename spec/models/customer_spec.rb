require 'rails_helper'

RSpec.describe Customer, type: :model do
 
  # === Validations ===
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:customer_number) }
  it { should validate_uniqueness_of(:customer_number) }


  # === Relations ===
  it { should have_many(:sales) }
  it { should have_many(:customer_services)}

   # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :surname }
  it { is_expected.to have_db_column :customer_number }
 
end
