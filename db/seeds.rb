require 'faker'

class Seed
  def initialize
    @user_ids   = []
    @office_ids = []
  end

  def create_user(role)
    user = User.create(email: Faker::Internet.email,
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                      mobile: Faker::Number.number(10),
                        role: role,
                    password: '123123123',
      password_confirmation: '1231123123')
    @user_ids << user.id if user.employee?
  end

  def create_office
    office = Office.create(
      street_address: Faker::Address.street_address,
              city: Faker::Address.city,
              alias: Faker::TvShows::ParksAndRec.city,
        contact_no: Faker::Number.number(10))
      @office_ids << office.id
  end

  def create_service
    date = Date.today
    Service.create(date: date,
                user_id: @user_ids[rand(@user_ids.length)],
              office_id: @office_ids[rand(@office_ids.length)],
                status: date.today? ? rand(1..2) : 0,
                  fare: Faker::Number.decimal(2).to_f)
  end

  def perform
    create_user(0)
    create_user(1)
    15.times { create_user(2) }
    10.times { create_office  }
    30.times { create_service }
  end
end

Seed.new.perform