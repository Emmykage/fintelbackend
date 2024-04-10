class AddStatusToPortfolio < ActiveRecord::Migration[7.1]
  def change
    add_column :portfolios, :status, :integer, default: 0
  end
end
