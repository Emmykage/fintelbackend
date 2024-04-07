class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios, id: :uuid do |t|
      t.decimal :amount
      t.integer :paid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :plan, null: false, foreign_key: true, type: :uuid
      t.boolean :paid

      t.timestamps
    end
  end
end
