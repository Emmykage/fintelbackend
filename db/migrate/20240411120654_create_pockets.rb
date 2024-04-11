class CreatePockets < ActiveRecord::Migration[7.1]
  def change
    create_table :pockets, id: :uuid do |t|
      t.string :name
      t.string :eth
      t.string :btc
      t.string :bank

      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
