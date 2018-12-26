class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :fields, Types::UserInputType, required: true

  field :user, Types::UserType, null: true
  field :error, [String], null: true

  def resolve(fields:)
    user = User.new(fields)
    user.save ? user : user.errors.full_messages
  end
end