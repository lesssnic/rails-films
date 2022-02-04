class CreateFilmGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :film_genres do |t|
      t.belongs_to :genre, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true
    end
  end
end
