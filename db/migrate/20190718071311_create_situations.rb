class CreateSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :situations do |t|
      t.string        :text
      t.timestamps null: true
    end
  end
end
