class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.string :email
      t.integer :role
      t.string :username

      t.timestamps
    end
  end
end
