class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :wallet_name
      t.integer :user_id
      t.integer :amount
    end
  end
end
