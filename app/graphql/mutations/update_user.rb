class Mutations::UpdateUser < GraphQL::Schema::Mutation
  null true

  argument :fields, Types::UserInputType, required: true

  field :user, Types::UserType, null: true
  field :error, [String], null: true

  def resolve(fields:)
    user = User.find_by(id: fields['id']) || context[:current_user]
    if user.update(fields.to_h)
      { user: user, error: nil }
    else
      { user: nil, error: user.errors.full_messages.uniq }
    end
  end
end