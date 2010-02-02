ActiveRecord::Schema.define(:version => 0) do 
  create_table :phones, :force => true do |t|
    t.string :phone
  end
  create_table :options_phones, :force => true do |t|
    t.string :other_phone
    t.string :fax
  end

end
