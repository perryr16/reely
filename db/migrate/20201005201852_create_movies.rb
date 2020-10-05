class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.float :rating
      t.string :imdb
      t.string :rotten
      t.string :metacritic
      t.string :trailer
      t.string :poster
      t.string :description

      t.timestamps
    end
  end
end
