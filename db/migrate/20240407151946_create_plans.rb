class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans, id: :uuid do |t|
      t.string :name
      t.decimal :price
      t.string :plan_type
      t.string :description

      t.timestamps
    end
  end
end
