class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description, null: false, default: ""
      t.integer :rating, null: false, default: 5
      t.references :film, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :reviews, [:film_id, :user_id], unique: true
  end
end
