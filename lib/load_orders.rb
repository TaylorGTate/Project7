Order.delete_all
99.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.safe_email(name)
    address = Faker::Address.street_address
    pay_type = "Check"
    Order.create(   name: name, 
                    email: email,
                    address: address,
                    pay_type: pay_type
                 )
end
