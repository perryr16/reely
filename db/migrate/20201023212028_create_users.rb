class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :google_token
      t.string :google_refresh_token
      t.string :photo

      t.timestamps
    end
  end
end
