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
end