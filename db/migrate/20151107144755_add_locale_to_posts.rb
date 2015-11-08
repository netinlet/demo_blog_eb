class AddLocaleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :locale, :string
    execute "UPDATE posts SET locale = 'en'"
  end
end
