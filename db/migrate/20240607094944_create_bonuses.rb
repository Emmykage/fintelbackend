class CreateBonuses < ActiveRecord::Migration[7.1]
  def change
    create_table :bonuses, id: :uuid do |t|
      t.decimal :amount
      t.references :wallet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
