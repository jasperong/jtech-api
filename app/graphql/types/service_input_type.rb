class Types::ServiceInputType < Types::BaseInputObject
  description 'Service input attributes'

  argument :date,          Types::DateType,    required: false
  argument :user_id,       Integer,                required: false
  argument :office_id,     Integer,                required: false
  argument :status,        Integer,                required: false
  argument :fare,          Float,                  required: false
end