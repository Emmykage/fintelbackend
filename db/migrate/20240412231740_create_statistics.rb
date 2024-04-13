class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics, id: :uuid do |t|
  
      t.timestamps
    end
  end
end
