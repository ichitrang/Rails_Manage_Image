class AddColumnToTrashes < ActiveRecord::Migration[7.2]
  def change
    add_column :trashes, :name, :string
  end
end
