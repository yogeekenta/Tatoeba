class CreateMetaphors < ActiveRecord::Migration[5.2]
  def change
    create_table :metaphors do |t|
      t.integer :user_id
      t.integer :situation_id
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end
