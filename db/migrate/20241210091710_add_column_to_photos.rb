class AddColumnToPhotos < ActiveRecord::Migration[7.2]
  def change
    add_column :photos, :name, :string
  end
end
