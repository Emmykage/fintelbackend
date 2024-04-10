class CreateEarnings < ActiveRecord::Migration[7.1]
  def change
    create_table :earnings, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
