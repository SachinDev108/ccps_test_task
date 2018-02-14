# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::Base # :nodoc:
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
      def parse_params(permitted_params)
        require_params = {}
        permitted_params.each_with_index do |(key, value), index|
          require_params[key] = if !index.zero?
                                  relationship_params(key, value)
                                else
                                  params.require(:attributes).permit(*value)
                                end
        end
        require_params
      end

      def relationship_params(key, value)
        params
          .require(:relationships)
          .require(key)
          .require(:data).permit(*value)
      end
    end
  end
end
