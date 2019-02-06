class Types::ServiceType < Types::BaseObject
  field :id,               ID,                         null: false
  field :office_id,        ID,                         null: false
  field :user_id,          ID,                         null: false
  field :date,             Types::DateType,            null: false
  field :employee,         Types::UserType,            null: false
  field :office,           Types::OfficeType,          null: false
  field :status,           String,                     null: false
  field :fare,             Float,                      null: true
  field :contact_name,     String,                     null: true
  field :contact_no,       String,                     null: true
  field :work_requested,   String,                     null: true
  field :work_done,        String,                     null: true
  field :ticket_no,        String,                     null: true
  field :start_time,       Types::DateTimeType,        null: true
  field :end_time,         Types::DateTimeType,        null: true

  def employee
    object.user
  end

  def office
    object.office
  end
end