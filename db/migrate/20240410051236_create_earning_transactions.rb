class CreateEarningTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :earning_transactions, id: :uuid do |t|
      t.decimal :amount
      t.references :earning, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
