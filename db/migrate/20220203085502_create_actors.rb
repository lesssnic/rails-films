class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :name, null: false
    end
    add_index :actors, :name, unique: true
  end
end
