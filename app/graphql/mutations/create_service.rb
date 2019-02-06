class Mutations::CreateService < GraphQL::Schema::Mutation
  null true

  argument :fields, Types::ServiceInputType, required: true

  field :service, Types::ServiceType, null: true
  field :error, [String], null: true

  def resolve(fields:)
    user_id = fields['userId'] || context[:current_user].id
    service = Service.find_or_create_by(date: fields['date'], user_id: user_id, office_id: fields['officeId'])
    if service.update(fields.to_h)
      { service: service, error: nil }
    else
      { service: nil, error: service.errors.full_messages.uniq }
    end
  end
end