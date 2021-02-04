class CreateTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :username
      t.string :profile_image_url

      t.timestamps
    end
  end
end
