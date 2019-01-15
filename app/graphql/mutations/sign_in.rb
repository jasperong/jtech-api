class Mutations::SignIn < GraphQL::Schema::Mutation
  null true

  argument :email,    String, required: true
  argument :password, String, required: true

  field :user,          Types::UserType, null: true
  field :signed_in,     Boolean,         null: false
  field :error,         String,          null: true

  def resolve(email:, password:)
    user = User.find_by(email: email)
    return { user: nil, error: 'Email is not registered', signed_in: false } if !user

    if user&.valid_password?(password)
      { user: user, error: nil, signed_in: true }
    else
      { user: nil, error: 'Password is incorrect', signed_in: false }
    end
  end
end