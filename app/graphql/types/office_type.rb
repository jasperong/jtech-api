class Types::OfficeType < Types::BaseObject
  field :id,                         ID,            null: false
  field :street_address              String,        null: false
  field :city,                       String,        null: false
  field :address,                    String,        null: false
  field :alias,                      String,        null: false
  field :contact_no,                 String,        null: false

  def address
    object.address
  end
end