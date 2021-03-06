require 'spec_helper'

RSpec.describe Vpsa::Entity::Commercial::CreditLimit do
  describe "as_parameter" do
    let(:credit_limit_as_parameter) {{"total" => BigDecimal.new("1000.53")}}
      
    it "should return the installment as parameter" do
      credit_limit = Vpsa::Entity::Commercial::CreditLimit.new({"total" => BigDecimal.new("1000.53")})
      
      expect(credit_limit.as_parameter).to eq(credit_limit_as_parameter)
    end
  end
end
