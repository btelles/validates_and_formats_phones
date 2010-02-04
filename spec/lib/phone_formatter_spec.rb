require File.dirname(__FILE__) + '/../spec_helper'

describe "String#to_formatted_number" do
  it 'should accept no arguments and an invalid phone number and return same string' do
    'aoeu'.to_phone.should == 'aoeu'
  end
  it 'should accept no arguments and a valid phone number and return a U.S. phone string' do
    '1234567890'.to_phone.should == '(123) 456-7890'
  end
  it "should accept a number escaped by '#' and return a formatted string" do
    'a123b123b12'.to_phone('####-####').should == '1231-2312'
  end
end
