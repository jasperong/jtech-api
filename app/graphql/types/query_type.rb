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

  # field :services, [Types::ServiceType], null: true do
  #   description 'Finds a list of services based on params'
  #   argument :params, Types::ServiceInputType, required: false
  # end

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

  # def services(params: nil)
  #   if params.empty?
  #     Service.all
  #   else
  #     Service.where(params.to_h)
  #   end
  # end
end
