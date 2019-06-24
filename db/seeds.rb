require 'faker'
require 'as-duration'

20.times do
  createdAt = Faker::Time.between(30.days.ago, Date.today, :all)
  RestoOrder.create(resto_name: Faker::Restaurant.name, amount_cents: Faker::Number.number(4), created_at: createdAt, updated_at: createdAt)
end

20.times do
  createdAt = Faker::Time.between(30.days.ago, Date.today, :all)
  CardPayment.create(merchant_name: Faker::FunnyName.name, amount_cents: Faker::Number.number(4), created_at: createdAt, updated_at: createdAt)
end

20.times do
  createdAt = Faker::Time.between(30.days.ago, Date.today, :all)
  MealVoucherCredit.create(company_name: Faker::Company.name, amount_cents: Faker::Number.number(4), created_at: createdAt, updated_at: createdAt)
end

