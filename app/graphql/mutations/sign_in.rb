class Mutations::SignIn < GraphQL::Schema::Mutation
  null true

  argument :email,    String, required: true
  argument :password, String, required: true

  field :user,     Types::UserType, null: true
  field :error,    String,        null: true

  def resolve(email:, password:)
    user = User.find_by(email: email)
    return 'Email is not registered' if !user

    if user&.valid_password?(password)
      user
    else
      'Password is incorrect'
    end
  end
end