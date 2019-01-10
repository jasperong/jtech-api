class Types::AllEmployeesType < Types::BaseObject
  field :employees,             [Types::UserType],     null: false
  field :current_page,          Integer,               null: true
  field :total_count,           Integer,               null: true
  field :per_page,              Integer,               null: true

  def total_count
    User.employee.count
  end

  def employees
    User.employee.limit(per_page).offset(per_page * current_page)
  end

  def current_page
    object[:current_page]
  end

  def per_page
    30
  end
end