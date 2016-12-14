class AddColumnsToFields < ActiveRecord::Migration
  def change
    add_column :fields, :name, :string
    add_column :fields, :decription, :string
  end
end
