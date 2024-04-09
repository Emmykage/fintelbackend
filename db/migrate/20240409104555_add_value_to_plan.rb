class AddValueToPlan < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :value, :string
  end
end