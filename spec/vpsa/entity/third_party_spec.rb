require 'spec_helper'

RSpec.describe Vpsa::Entity::Administrative::ThirdParty do
  describe "as_parameter" do
    let(:third_party_as_parameter) {{"name" => "name", "email" => "email@email.com", "birthday" => "14/10/2014", "city" => "city", "state" => "state",
      "zip_code" => "12233-444", "phone_attributes" => {"country_code" => "+55", "area_code" => "12", "number" => "998998789"}, 
      "dynamic_field" => "123"}}
      
    it "should return the contact as parameter" do
      contact = Oneview::Entity::Contact.new
      
      contact.name = "name"
      contact.email = "email@email.com"
      contact.birthday = "14/10/2014"
      contact.city = "city"
      contact.state = "state"
      contact.zip_code = "12233-444"
      
      phone = Oneview::Entity::Phone.new
      phone.country_code = "+55"
      phone.area_code = "12"
      phone.number = "998998789"
      
      contact.phone = phone
      
      dynamic_field = Oneview::Entity::DynamicField.new
      dynamic_field.name = "dynamic_field"
      dynamic_field.value = "123"
      
      contact.dynamic_fields << dynamic_field
      
      expect(contact.as_parameter).to eq(contact_as_parameter)
    end
  end
end
