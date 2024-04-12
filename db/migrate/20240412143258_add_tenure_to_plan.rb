class AddTenureToPlan < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :tenure, :integer, default: 2
    add_column :plans, :rate, :float
  end
end
