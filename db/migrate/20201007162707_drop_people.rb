class DropPeople < ActiveRecord::Migration[6.0]
  def change
    drop_table :movie_people
    drop_table :people
  end
end
