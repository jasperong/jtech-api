class Types::ServiceInputType < Types::BaseInputObject
  description 'Service input attributes'

  argument :date,          Types::DateType,        required: false
  argument :user_id,       ID,                     required: false
  argument :office_id,     ID,                     required: false
  argument :status,        Integer,                required: false
  argument :fare,          Float,                  required: false
end