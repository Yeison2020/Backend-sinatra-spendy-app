require 'faker'
puts "🌱 Seeding spices..."

Bill.destroy_all
User.destroy_all
Wallet.destroy_all


User.create( name: "Aidan", occupation: "FullstackDeveloper Extrodinaire", password: "password")
User.create( name: "Andrea", occupation: "FullstackDeveloper Extrodinaire", password: "password")
User.create( name: "Yeison", occupation: "FullstackDeveloper Extrodinaire", password: "password")

Wallet.create( wallet_name: "Aidan's Wallet",  amount: rand(70000..90000), user_id: 1)
Wallet.create( wallet_name: "Andrea's Wallet",  amount: rand(70000..90000), user_id: 2)
Wallet.create( wallet_name: "Yeison's Wallet",  amount: rand(70000..90000), user_id: 3)

7.times do 
wallet = Wallet.create(
    wallet_name: Faker::Company.name,
    # amount: Faker::Commerce.price, 
    amount: rand(800..3000),
    user_id: rand(4..10) 
)

end

10.times do 

    bills = Bill.create(
        bill_name: Faker::Commerce.department ,
        bill_amount: Faker::Commerce.price ,
        category_name: Faker::Commerce.product_name ,
        wallet_id: rand(1..10)
    )
end





puts "✅ Done seeding!"
