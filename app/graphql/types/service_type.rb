class Types::ServiceType < Types::BaseObject
  field :id,               ID,                         null: false
  field :date,             Types::DateTimeType,        null: false
  field :employee,         Types::UserType,            null: false
  field :office,           Types::OfficeType,          null: false
  field :status,           String,                     null: false
  field :fare,             Float,                      null: false
end