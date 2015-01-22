module Vpsa
  module Entity
    class Base
      def as_parameter
        variables = instance_variables.map do |name|
          variable_name = name.to_s.tr("@", "")
          
          [variable_name, instance_variable_get(name)]
        end
         
        Hash[variables]
      end
    end
  end
end