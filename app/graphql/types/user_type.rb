class Types::UserType < Types::BaseObject
  field :id,                         ID,                        null: true
  field :email,                      String,                    null: true
  field :first_name,                 String,                    null: true
  field :last_name,                  String,                    null: true
  field :full_name,                  String,                    null: true
  field :mobile,                     String,                    null: true
  field :authentication_token,       String,                    null: true
  field :current_service,            Types::ServiceType,        null: true
  field :current_page,               Integer,                   null: true
  field :total_count,                Integer,                   null: true

  def current_service
    object.current_service
  end
end