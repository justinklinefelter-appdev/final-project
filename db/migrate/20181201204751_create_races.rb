class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :event_id
      t.string :location

      t.timestamps
    end
  end
end
