class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :name, null: false
      t.integer :budget
      t.integer :gather
      t.text :description, null: false
      t.string :poster
      t.string :imdb
      t.string :limit, null: false, default: "18+"
      t.references :director, foreign_key: true
    end
  end
end
