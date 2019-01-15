class Types::AllServicesType < Types::BaseObject
  field :services,              [Types::ServiceType],  null: false
  field :current_page,          Integer,               null: true
  field :total_count,           Integer,               null: true
  field :per_page,              Integer,               null: true

  def services
    object[:services]
  end

  def total_count
    object[:services].count
  end

  def employees
    object[:services].limit(per_page).offset(per_page * current_page)
  end

  def current_page
    object[:current_page]
  end

  def per_page
    30
  end
end