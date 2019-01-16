module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/users/{id}' do
      #include Swagger::ErrorSchema

      operation :get do
        key :description, 'Find a user by ID'
        key :operationId, :find_user_by_id

        parameter name: :id do
          key :in, :path
          key :description, 'User ID'
          key :required, true
          key :type, :integer
          key :format, :int64
        end

        response 200 do
          key :description, 'User'
          schema do
            key :'$ref', :User
          end
        end

        extend Swagger::ErrorResponses::NotFoundError

      end
    end

    swagger_path '/users' do

      operation :get do
        key :description, 'Returns all users'
        key :operationId, 'all_users'
        key :produces, [
            'application/json',
            'text/html'
        ]
        parameter do
          key :name, :limit
          key :type, :array

        end
      end

    end
  end
end