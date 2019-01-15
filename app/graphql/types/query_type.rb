class Types::QueryType < Types::BaseObject
  field :users, [Types::UserType], null: true do
    description 'Finds a list of users based on ids'
    argument :ids, [ID], required: true
  end

  field :all_employees, Types::AllEmployeesType,   null: true do
    description 'Finds a list of employees'
    argument :page, Integer, required: true
  end

  field :offices,       [Types::OfficeType], null: true
  field :locations,     [String],            null: true

  field :all_services, Types::AllServicesType, null: true do
    description 'Finds a list of services based on params'
    argument :params, Types::ServiceInputType, required: false
    argument :page,   Integer,                 required: true
  end

  def users(ids:)
    ids ? User.where(id: ids) : User.all
  end

  def all_employees(page:)
    { current_page: page }
  end

  def offices
    Office.all
  end

  def locations
    Office.pluck(:alias)
  end

  def all_services(params: nil, page:)
    if params.empty?
      { services: Service.all, current_page: page}
    else
      { services: Service.where(params.to_h), current_page: page}
    end
  end
end
