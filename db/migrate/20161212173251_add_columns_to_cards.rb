class AddColumnsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :firstname, :string
    add_column :cards, :lastname, :string
  end
end
