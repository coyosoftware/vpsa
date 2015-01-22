require 'spec_helper'

RSpec.describe Vpsa do
  it "should return a new Vpsa::Client" do
    expect(Vpsa.new("abc").class).to eq(Vpsa::Client)
  end
end