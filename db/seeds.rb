Customer.create!(name: 'first-customer')
Apartment::Tenant.switch!('first-customer')
User.create!(email: 'user1@customer.com', password: '123123123', password_confirmation: '123123123')

Customer.create!(name: 'second-customer')
Apartment::Tenant.switch!('second-customer')
User.create!(email: 'user2@customer.com', password: '123123123', password_confirmation: '123123123')
