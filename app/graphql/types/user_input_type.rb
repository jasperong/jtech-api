class Types::UserInputType < Types::BaseInputObject
  description 'User input attributes'

  argument :first_name,    String,    required: true
  argument :last_name,     String,    required: true
  argument :mobile,        String,    required: true
  argument :email,         String,    required: true
  argument :role,          Integer,   required: false
end