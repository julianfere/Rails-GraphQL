class Mutations::CreateUser < Mutations::BaseMutation
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
