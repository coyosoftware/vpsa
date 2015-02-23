require 'spec_helper'

RSpec.describe Vpsa::Client do
  it "should return a new Vpsa::Api::ThirdParties" do
    expect(Vpsa.new("abc").third_parties.class).to eq(Vpsa::Api::ThirdParties)
  end
  
  it "should return a new Vpsa::Api::Entities" do
    expect(Vpsa.new("abc").entities.class).to eq(Vpsa::Api::Entities)
  end
  
  it "should return a new Vpsa::Api::DefaultEntries" do
    expect(Vpsa.new("abc").default_entries.class).to eq(Vpsa::Api::DefaultEntries)
  end
  
  it "should return a new Vpsa::Api::Provisions" do
    expect(Vpsa.new("abc").provisions.class).to eq(Vpsa::Api::Provisions)
  end
  
  it "should return a new Vpsa::Api::UserData" do
    expect(Vpsa.new("abc").user_data.class).to eq(Vpsa::Api::UserData)
  end
  
  it "should return a new Vpsa::Api::Installments" do
    expect(Vpsa.new("abc").installments.class).to eq(Vpsa::Api::Installments)
  end

  it "should return a new Vpsa::Api::CreditLimits" do
    expect(Vpsa.new("abc").credit_limits.class).to eq(Vpsa::Api::CreditLimits)
  end

  it "should return a new Vpsa::Api::ClientClasses" do
    expect(Vpsa.new("abc").client_classes.class).to eq(Vpsa::Api::ClientClasses)
  end
end