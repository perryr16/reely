class DropTwitterUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :twitter_users
  end
end
