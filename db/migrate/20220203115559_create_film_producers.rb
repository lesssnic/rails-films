class CreateFilmProducers < ActiveRecord::Migration[6.1]
  def change
    create_table :film_producers do |t|
      t.belongs_to :producer, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true
    end
    add_index :film_producers, [:film_id, :producer_id], unique: true
  end
end
