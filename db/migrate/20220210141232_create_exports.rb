class CreateExports < ActiveRecord::Migration[6.1]
  def change
    create_table :exports do |t|
      t.string :name
      t.timestamps
    end
  end
end
