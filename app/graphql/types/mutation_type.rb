class Types::MutationType < Types::BaseObject
  field :sign_in,                    mutation: Mutations::SignIn
  field :create_user,                mutation: Mutations::CreateUser
end
