class Types::QueryType < Types::BaseObject
  field :users, [Types::UserType], null: true do
    description 'Finds a list of users based on ids'
    argument :ids, [ID], required: true
  end

  field :user, Types::UserType, null: true do
    description 'Finds a user based on id'
    argument :id, ID, required: true
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

  field :service, Types::ServiceType, null: true do
    description 'Finds a service based on ID'
    argument :fields, Types::ServiceInputType, required: true
  end

  field :request_reset_password, String, null: true do
    description 'Requests reset password email'
    argument :email, String, required: true
  end

  field :reset_password, Types::UserType, null: true do
    description 'Reset password'
    argument :fields, Types::UserInputType, required: true
  end

  field :current_user, Types::UserType, null: true

  def users(ids:)
    ids ? User.where(id: ids) : User.all
  end

  def user(id:)
    User.find_by(id: id)
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

  def service(fields:)
    _fields = fields.to_h
    _fields.merge!(user_id: context[:current_user]&.id) if _fields[:id].nil?
    Service.find_by(_fields)
  end

  def request_reset_password(email:)
    user = User.find_by(email: email)
    return 'Email not found' if user.nil?
    user.send_reset_password_instructions
  end

  def reset_password(fields:)
    user = User.find_by(reset_password_token: fields[:reset_password_token])
    user&.update(
      password: fields[:password],
      password_confirmation: fields[:password_confirmation]
    )
    user&.reload
  end

  def current_user
    context[:current_user] || { authentication_token: nil }
  end
end
