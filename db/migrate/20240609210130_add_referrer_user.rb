class AddReferrerUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :referrer_id, :uuid
  end
end
