class AddWithdrawnToPortfolioInterest < ActiveRecord::Migration[7.1]
  def change
    add_column :portfolio_interests, :withdrawn, :boolean, default: false
  end
end
