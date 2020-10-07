class DeleteDirectorFromMovie < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :direcector
    add_column :movies, :director, :string
  end
end
