class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :blog
      t.string :name, null: false, default: ''
      t.text :body, null: false

      t.timestamps
    end
  end
end
