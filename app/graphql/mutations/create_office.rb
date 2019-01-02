class Mutations::CreateOffice < GraphQL::Schema::Mutation
  null true

  argument :fields, Types::OfficeInputType, required: true

  field :office, Types::OfficeType, null: true
  field :error, [String], null: true

  def resolve(fields:)
    office = Office.new(fields.to_h)
    if office.save
      { office: office, error: nil }
    else
      { office: nil, error: office.errors.full_messages.uniq }
    end
  end
end