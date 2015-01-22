require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Administrative
      class ThirdParty < Base
        attr_accessor :id, :active, :updated_at, :name, :fantasy_name, :document, :emails, :rg, :birth_date, :ie
      end
    end
  end
end