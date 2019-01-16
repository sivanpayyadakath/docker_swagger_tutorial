module Swagger::SampleAppRoot
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_root do
      key :swagger, '2.0'
      key :host, 'localhost:3000'

      info do
        key :title, 'users'
        key :version, '1.0'
        key :description, 'User operations'
      end

      extend Swagger::Parameters
    end
  end

end