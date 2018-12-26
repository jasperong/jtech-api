class Types::QueryType < Types::BaseObject
  field :users, [Types::UserType], null: true do
    description 'Finds a list of users based on ids'
    argument :ids, [ID], required: true
  end

  def users(ids:)
    User.where(id: ids)
  end
end
