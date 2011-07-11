class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :tags
      t.string :author
      t.string :permalink
      t.datetime :pubdate

      t.timestamps
    end
  end
end
