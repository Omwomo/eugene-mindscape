class RenameColumnsInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :author_id_id, :author_id
    rename_column :posts, :comment_counter, :comments_counter
    change_column_comment :posts, :comments_counter, 'Counter for comments on the post'
  end
end
