class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :fields, Types::UserInputType, required: true

  field :user, Types::UserType, null: true
  field :error, [String], null: true

  def resolve(fields:)
    user = User.new(fields.to_h)
    if user.save
      { user: user, error: nil }
    else
      { user: nil, error: user.errors.full_messages.uniq }
    end
  end
end