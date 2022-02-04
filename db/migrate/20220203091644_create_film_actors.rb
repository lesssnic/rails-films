class CreateFilmActors < ActiveRecord::Migration[6.1]
  def change
    create_table :film_actors do |t|
      t.belongs_to :actor, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true
    end
    add_index :film_actors, [:film_id, :actor_id], unique: true
  end
end
