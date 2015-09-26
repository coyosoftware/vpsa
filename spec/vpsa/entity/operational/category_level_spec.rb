require 'spec_helper'

RSpec.describe Vpsa::Entity::Operational::CategoryLevel do
  describe "as_parameter" do
    
    let(:category_level_as_parameter) {{"id"=>"1", 'ativo'=>'ativo', 'dataAlteracao'=>'01/01/2000', 'nome'=>'nome', 'nivel'=>'1', 
      'compoeReferenciaBase'=>'1', 'idNivelCategoriaProdutoPai'=> '1'}}
      
      
    it "should return the product as parameter" do
      category_level = Vpsa::Entity::Operational::CategoryLevel.new({"id"=>"1", 'ativo'=>'ativo', 'dataAlteracao'=>'01/01/2000', 'nome'=>'nome', 'nivel'=>'1', 
      'compoeReferenciaBase'=>'1', 'idNivelCategoriaProdutoPai'=> '1'})
      
      expect(category_level.as_parameter).to eq(category_level_as_parameter)
    end
    
    
  end
  
end