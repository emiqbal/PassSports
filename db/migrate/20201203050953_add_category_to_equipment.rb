class AddCategoryToEquipment < ActiveRecord::Migration[6.0]
  def change
    add_column :equipment, :category, :string
  end
end
