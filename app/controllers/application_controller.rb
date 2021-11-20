class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
 # Bill Routers---------------------------------------------
 
 
  get "/" do
    { message: "Howdy I'm working! 🚀🚀🚀 Please don't break me " }.to_json
  end

  #gets all bills
  get "/bill" do
    bills = Bill.all
    bills.to_json
  end

  #gets a specific bill

  get "/bill/:id" do
    a_bill = Bill.find(params[:id])
    a_bill.to_json

end
  
#deletes a specific bill

delete "/bill/:id" do
  a_bill = Bill.find(params[:id])
  a_bill.destroy
  a_bill.to_json
end

#creates a new bill

post "/bill" do
    make_bill = Bill.create(
      bill_name: params[:bill_name],
      bill_amount: params[:bill_amount],
      category_name: params[:category_name],
      wallet_id: params[:wallet_id]
    )
    make_bill.to_json
end

# edits a specific bill

patch "/bill/:id" do
    a_bill = Bill.find(params[:id])
    a_bill.update(
      bill_name: params[:bill_name],
      bill_amount: params[:bill_amount],
      category_name: params[:category_name]
    )
    a_bill.to_json
end



#Wallet Routers------------------------------------------------------

#gets all wallets
get "/wallet" do
  all_wallets = Wallet.all
  all_wallets.to_json
end

#gets a specific wallet

get "/wallet/:id" do
  a_wallet = Wallet.find(params[:id])
  a_wallet.to_json
end

get "/wallet/total/:id" do
  a_wallet = Wallet.find(params[:id])
  a_wallet.total_amount.to_json
end

#gets all bills from a specific wallet

  get "/wallet/bills/:id" do
    wallet_bills = Wallet.find(params[:id]).bills
    wallet_bills.to_json

  end

#deletes a specific wallet

delete "/wallet/:id" do
  a_wallet = Wallet.find(params[:id])
  a_wallet.destroy
  a_wallet.to_json
end

#creates a new wallet

post "/wallet" do
  make_wallet = Wallet.create(
    wallet_name: params[:wallet_name],
    amount: params[:amount]
  )
  make_wallet.to_json
end

# edits a specific wallet

patch "/wallet/:id" do
  a_wallet = Wallet.find(params[:id])
  a_wallet.update(
    wallet_name: params[:wallet_name],
    amount: params[:amount]
  )
  a_wallet.to_json
end

#User Routers---------------------------------------------

get "/user" do
  a_user = User.all
  a_user.to_json
end

get "/user/:id" do
  a_user = User.find(params[:id])
  a_user.to_json
end

delete "/user/:id" do
  a_user.find(params[:id])
  a_user.destroy
  a_user.to_json
end

patch "/user/:id" do
  a_user = User.find(params[:id])
  a_user.update(
    name: params[:name],
    password: params[:password]
    # logged_in: !logged_in
  )
  a_user.to_json
end





post "/user/login" do
  user = User.create(
    name: params[:name],
    password: params[:password]
  )
  user.to_json
end




# Grabs a particular users and their wallet

get "/user/wallets/bills/:username" do
  user = User.find_by(name: params[:username])
  user.to_json(:include => {:wallets => {:include => :bills}})
end


get "/user/wallets/:username" do
  userWallet = User.find_by(name: params[:username])
  userWallet.to_json(include: :wallets)
end

get "/user/wallets/bills/total/:username" do
  user = User.find_by(name: params[:username])
  wallet = Wallet.find_by(user_id: user.id)
  wallet.total_amount.to_json
end

post "/user/wallets/bills/:username" do
  bill = Bill.create(
    bill_name: params[:bill_name], 
    bill_amount: params[:bill_amount],
    category_name: params[:category_name],
    wallet_id: params[:wallet_id]
  )
  bill.to_json
end

# user = User.create(
#     name: params[:name],
#     password: params[:password]
#   )
#   user.to_json

end