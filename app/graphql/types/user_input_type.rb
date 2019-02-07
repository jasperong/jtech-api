class Types::UserInputType < Types::BaseInputObject
  description 'User input attributes'

  argument :first_name,                     String,    required: false
  argument :last_name,                      String,    required: false
  argument :mobile,                         String,    required: false
  argument :email,                          String,    required: false
  argument :role,                           Integer,   required: false
  argument :password,                       String,    required: false
  argument :password_confirmation,          String,    required: false
  argument :reset_password_token,           String,    required: false
end