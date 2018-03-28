class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.text :genres
      t.text :casts
      t.string :duration
      t.string :orititle
      t.text :directors
      t.string :year
      t.string :images

      t.timestamps
    end
  end
end
