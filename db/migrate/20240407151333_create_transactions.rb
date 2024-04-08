class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.decimal :amount
      t.integer :transaction_type 
      t.integer :status, default: 0
      t.string :address
      t.integer :coin_type, default: 0
      t.references :wallet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
