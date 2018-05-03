module OpenApi
  module Serializers
    class BaseSerializer
      def serialize(specification)
        root_serializer.serialize(specification)
      end

      def deserialize(string)
        raise NotImplementedError
      end

      def root_serializer
        raise NotImplementedError
      end
    end
  end
end
