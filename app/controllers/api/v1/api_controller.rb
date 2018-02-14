module Api
  module V1
    class ApiController < ActionController::Base
      include ErrorHandler

      def expected_parameter_type(excepted_type)
        data_type = params.require(:type)
        return if data_type == excepted_type.to_s

        raise(
          ActionController::ParameterMissing,
            "Param has invalid type '#{data_type}', expected '#{excepted_type}'"
        )
      end

      # first element in permitted_params will be model attributes
      # other will be relationships
      def parse_params permitted_params
        require_params = {}
        permitted_params.each_with_index do |(key, value), index|
          if !index.zero?
            require_params[key] = params
            .require(:relationships)
            .require(key)
            .require(:data).permit(*value)
          else   
            require_params[key] = params.require(:attributes).permit(*value)
          end
        end
        require_params
      end
    end
  end
end      