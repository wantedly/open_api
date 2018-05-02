module OpenApi
  module EquatableAsContent
    def ==(other)
      self.all_instance_variables == other.all_instance_variables
    end

    protected

    def all_instance_variables
      instance_variables.map { |name| instance_variable_get(name) }
    end
  end
end
