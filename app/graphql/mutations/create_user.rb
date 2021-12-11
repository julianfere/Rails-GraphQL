# frozen_string_literal: true

module Mutations
  ##
  # This class defines the arguments and resolver for creating a user with GraphQL
  class CreateUser < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :phone, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:, phone:)
      user = User.new(name: name, email: email, phone: phone)

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
