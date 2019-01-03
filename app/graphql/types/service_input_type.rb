class Types::ServiceInputType < Types::BaseInputObject
  description 'Service input attributes'

  argument :date,          Types::DateTimeType,    required: true
  argument :user_id,       Integer,                required: true
  argument :office_id,     Integer,                required: true
  argument :status,        Integer,                required: true
  argument :fare,          Float,                  required: false
end