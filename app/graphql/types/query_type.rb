# frozen_string_literal: true

module Types
  ##
  # This class defines the GraphQL queries and resolvers methods
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false do
      argument :last,  Integer, required: false
      argument :first, Integer, required: false
    end

    ##
    # Return a list of users
    #
    # @params [Integer] first: return n° first users
    # @params [Integer] last:  return n° last users
    #
    # @return [Array<User>]
    def users(**query)
      if query[:first]
        User.first(query[:first])
      elsif query[:last]
        User.last(query[:last])
      else
        User.all
      end
    end

    # /user/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    ##
    # Return an User by id or a blank user in case of not found
    #
    # @params [Integer] id: the id of the user
    #
    # @return [User]
    def user(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound
      User.new
    end
  end
end
