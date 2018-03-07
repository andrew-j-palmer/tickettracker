class AddStatusColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :status, :text
  end
end
