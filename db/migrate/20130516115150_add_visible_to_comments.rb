class AddVisibleToComments < ActiveRecord::Migration
  def change
    add_column :comments, :visible, :boolean, :null => false, :default => false
  end
end
