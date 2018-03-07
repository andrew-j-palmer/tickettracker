class CreateJoinTableFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commenter
    add_column :comments, :user_id, :integer
  end
end
