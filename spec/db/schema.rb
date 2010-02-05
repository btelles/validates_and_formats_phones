ActiveRecord::Schema.define(:version => 0) do 

  create_table :phones, :force => true do |t|
    t.string :phone
  end

  create_table :options_phones, :force => true do |t|
    t.string :other_phone
    t.string :fax
  end

  create_table :if_options, :force => true do |t|
    t.string :phone_if_true
    t.string :phone_if_false
    t.string :phone_unless_true
    t.string :phone_unless_false
  end
end
