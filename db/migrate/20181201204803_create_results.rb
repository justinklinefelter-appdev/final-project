class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :race_id
      t.string :time
      t.string :overall_place
      t.string :age_group_place
      t.string :body
      t.string :link
      t.string :year

      t.timestamps
    end
  end
end
