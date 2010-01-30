require File.dirname(__FILE__) + '/spec_helper'

class Phone < ActiveRecord::Base
  validates_and_formats_phones 
end
class OptionsPhone < ActiveRecord::Base
  validates_and_formats_phones :other_phone, 
                               '####-####',
                               '(###) ###-####'
end

describe "ValidatesAndFormatsPhones" do

  valid_phones = ['1234567890', '123-456-7890', '(123) 456-7890', 'o123.456-7890']
  invalid_phones = ['01234567890', '12-456-7890', '(123) 456-8', 'o1123.456-7890']

  valid_phones.each do |phone|
    it "allows saving of valid phone #{phone}" do
      lambda {
        Phone.create!(:phone => phone)
      }.should_not raise_error

      Phone.create!(:phone => phone).should be_instance_of(Phone) end
    it "formats the phone according to a reasonable default option" do
      new_phone = Phone.create!(:phone => phone)
      new_phone.phone.should == "(123) 456-7890"
    end
  end

  describe "accepts different phone formats" do
    it "by passing validation" do
      lambda {
        OptionsPhone.create!(:other_phone => '12345678')
      }.should_not raise_error
    end
    it "by formatting the string in the new format" do
        phone = OptionsPhone.create!(:other_phone => '12345678')
        phone.other_phone.should == "1234-5678"
    end
  end

  describe "accepts more phone fields" do
    it ". They pass validation when the format is correct." do
      lambda {
        OptionsPhone.create!(:other_phone => '12345678')
      }.should_not raise_error
    end
    it ". Their format ends up corrrected" do
      phone = OptionsPhone.create!(:other_phone => '12345678')
      phone.other_phone.should == "1234-5678"
    end
  end

  describe "rejects invalid formats" do
    invalid_phones.each do |invalid_number|
      it "when on the default field" do
        lambda {
          Phone.create!(:phone => invalid_number)
        }.should raise_error
      end
      it "when on a non-default field" do
        lambda {
          OptionsPhone.create!(:other_phone => invalid_number)
        }.should raise_error

      end

    end

      
  end
end
