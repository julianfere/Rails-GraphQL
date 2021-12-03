module Types
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false do
      argument :last,  Integer, required: false
      argument :first, Integer, required: false
    end

    def users(**query)
      if query[:first]
        User.first(query[:first])
      elsif query[:last]
        User.last(query[:last])
      end
    end

    # /user/:id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound
      User.new
    end
  end
end
