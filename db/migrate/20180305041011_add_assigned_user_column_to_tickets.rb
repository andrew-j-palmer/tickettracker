class AddAssignedUserColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :assigned_user, :integer
  end
end
