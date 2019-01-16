module Swagger::SampleAppRoot
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_root do
      key :swagger, '2.0'
      extend Swagger::Parameters
    end
  end

end