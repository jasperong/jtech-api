class Types::UserType < Types::BaseObject
  field :id,                         ID,                        null: false
  field :email,                      String,                    null: false
  field :first_name,                 String,                    null: false
  field :last_name,                  String,                    null: false
  field :full_name,                  String,                    null: false
  field :mobile,                     String,                    null: false
  field :authentication_token,       String,                    null: false
  field :current_service,            Types::ServiceType,        null: false
  field :current_page,               Integer,                   null: true
  field :total_count,                Integer,                   null: true

  def current_service
    object.current_service
  end
end