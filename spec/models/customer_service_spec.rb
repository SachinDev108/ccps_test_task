require 'rails_helper'

RSpec.describe CustomerService, type: :model do
  
  # === Relations ===
  it { should belong_to(:customer) }
 
  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :comment }
  it { is_expected.to have_db_column :customer_number }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["customer_number"]}

end
