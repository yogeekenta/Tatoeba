class AddImageToSituations < ActiveRecord::Migration[5.2]
  def change
    add_column :situations, :image, :text
  end
end
