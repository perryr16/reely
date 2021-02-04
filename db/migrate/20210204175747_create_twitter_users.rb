class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :username
      t.string :profile_image_url

      t.index :username, unique: true

      t.timestamps
    end
  end
end
