class AddColumnsToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :cast, :string
    add_column :movies, :direcector, :string
    add_column :movies, :rated, :string
    add_column :movies, :genre, :string
  end
end
