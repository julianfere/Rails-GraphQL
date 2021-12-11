# frozen_string_literal: true

module Types
  ##
  # Defines the User data type for GraphQL queries
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :name, String, null: true
    field :phone, String, null: true
    field :posts, [Types::PostType], null: true
    field :posts_count, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    ##
    # Custom field for UserType
    #
    # @returns [Integer] ammount of post related to the User
    def posts_count
      object.posts.size
    end
  end
end
