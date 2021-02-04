class AddAuthorIdToTwitterUser < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_users, :author_id, :string
  end
end
