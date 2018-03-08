class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :content
      t.string :email
      t.integer :like_count

      t.timestamps
    end
  end
end
