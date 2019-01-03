class Types::MutationType < Types::BaseObject
  field :sign_in,                    mutation: Mutations::SignIn
  field :create_user,                mutation: Mutations::CreateUser
  field :update_user,                mutation: Mutations::UpdateUser
  field :create_office,              mutation: Mutations::CreateOffice
  field :create_service,             mutation: Mutations::CreateService
end
