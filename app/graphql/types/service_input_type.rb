class Types::ServiceInputType < Types::BaseInputObject
  description 'Service input attributes'

  argument :id,                     ID,                     required: false
  argument :date,                   Types::DateType,        required: false
  argument :user_id,                ID,                     required: false
  argument :office_id,              ID,                     required: false
  argument :status,                 String,                 required: false
  argument :fare,                   Float,                  required: false
  argument :work_done,              String,                 required: false
  argument :work_requested,         String,                 required: false
  argument :ticket_no,              String,                 required: false
  argument :start_time,             Types::DateTimeType,    required: false
  argument :end_time,               Types::DateTimeType,    required: false
end