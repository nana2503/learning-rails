class CreateBlogPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :body
      t.integer :owner_id

      t.timestamps
    end
  end
end
