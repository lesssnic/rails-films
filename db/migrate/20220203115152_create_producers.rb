class CreateProducers < ActiveRecord::Migration[6.1]
  def change
    create_table :producers do |t|
      t.string :name, null: false
    end
    add_index :producers, :name, unique: true
  end
end
