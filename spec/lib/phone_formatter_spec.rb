require File.dirname(__FILE__) + '/../spec_helper'

describe "String#to_formatted_number" do
  it 'should accept no arguments and return the same string' do
    'aoeu'.to_phone.should == 'aoeu'
  end
  it "should accept a number escaped by '#' and return a formatted string" do
    'a123b123b123'.to_phone('###-###-###').should == '123-123-123'
  end
end
