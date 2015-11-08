class CreatePosts < ActiveRecord::Migration
  enable_extension 'uuid-ossp'
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title
      t.text :body
      t.timestamps null: false
    end
  end
end
