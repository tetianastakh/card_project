class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :fields, :decription, :description
  end
end
