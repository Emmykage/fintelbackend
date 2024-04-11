class CreateTriggers < ActiveRecord::Migration[7.1]
  def change
    create_table :triggers, id: :uuid do |t|

      t.timestamps
    end
  end
end
