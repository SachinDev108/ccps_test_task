require 'rails_helper'

RSpec.describe Sale, type: :model do  
  
  # === Relations ===
  it { should belong_to(:customer) }
 

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :item }
  it { is_expected.to have_db_column :customer_number }
  it { is_expected.to have_db_column :price }
  it { is_expected.to have_db_column :source }
  it { is_expected.to have_db_column :date_of_transaction }
  

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["customer_number"]}
  

  # === Validations ===
  it { should validate_presence_of(:item) }
  it { should validate_presence_of(:customer_number) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:date_of_transaction) }
  it { should validate_presence_of(:source) }
  it { should validate_numericality_of(:price) }

end
