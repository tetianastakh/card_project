class AddCardToFields < ActiveRecord::Migration
  def change
    add_column :fields, :card_id, :string
  end
end
