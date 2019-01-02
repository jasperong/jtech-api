class Types::UserInputType < Types::BaseInputObject
  description 'User input attributes'

  argument :street_address,    String,    required: true
  argument :city,              String,    required: true
  argument :alias,             String,    required: true
  argument :contact_no,        String,    required: true
end