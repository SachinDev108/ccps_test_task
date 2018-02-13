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
    end
  end
end      