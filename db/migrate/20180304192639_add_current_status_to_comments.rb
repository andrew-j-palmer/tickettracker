class AddCurrentStatusToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :currentstatus, :string
  end
end
