require 'spec_helper'

describe Customer do

   context 'must have a valid VAT number' do
      it 'VAT must have 11 digits' do
        FactoryGirl.build(:customer, vat: '12345678901').should be_valid
        FactoryGirl.build(:customer, vat: '1234567890').should_not be_valid
        FactoryGirl.build(:customer, vat: '123456789012').should_not be_valid
        FactoryGirl.build(:customer, vat: 'a2345678901').should_not be_valid
      end

      it 'VAT must have a valid checksum'

    end
end