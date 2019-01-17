module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks
  include Swagger::ErrorSchema

  included do

    swagger_path '/users/{id}' do

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
          key :description, 'User specified by ID'
          schema do
            key :required, [:id, :name]
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :name do
              key :type, :string
            end
          end
        end


        extend Swagger::ErrorResponses::NotFoundError

      end
    end

    swagger_path '/users' do

      operation :get do
        key :description, 'Returns all users'
        key :operationId, 'all_users'
        key :produces,[
            'application/json'
        ]

        response 200 do
          key :description, 'User'
          schema do
            key :'$ref', :User
          end
        end
        extend Swagger::ErrorResponses::NotFoundError
      end

    end

  end
end