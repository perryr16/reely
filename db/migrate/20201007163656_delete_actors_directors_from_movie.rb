class DeleteActorsDirectorsFromMovie < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :cast
    remove_column :movies, :director
  end
end
