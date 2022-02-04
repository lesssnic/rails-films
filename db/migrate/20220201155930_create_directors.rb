class CreateDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :photo, null: false, default: ""
    end
    add_index :directors, [:first_name, :last_name], unique: true
  end
end
