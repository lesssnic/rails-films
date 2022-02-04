class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string :first_name, :null => false, :default => ""
      t.string :last_name, :null => false, :default => ""
      t.string :photo, :null => false, :default => ""
      t.string :description, :null => false, :default => ""
    end

    create_table :producers do |t|
      t.string :producer_name, :null => false

    end

    add_index :producers, :producer_name, unique: true

    create_table :directors do |t|
      t.string :first_name, :null => false, :default => ""
      t.string :last_name, :null => false, :default => ""
      t.string :photo, :null => false, :default => ""
    end

    create_table :genres do |t|
      t.string :genre_name, :null => false
    end

    add_index :genres, :genre_name, unique: true

    create_table :limit_names do |t|
      t.string :limit_name, :null => false
      t.string :description, :null => false, :default => ""
    end

    add_index :limit_names, :limit_name, unique: true

    create_table :films do |t|
      t.string :name, :null => false
      t.integer :budget
      t.integer :gather
      t.string :IMDB
      t.string :description, :null => false
      t.string :poster, :null => false, :default => ""
      add_reference :limit_names, :limit_name, foreign_key: true
    end
  end
end
