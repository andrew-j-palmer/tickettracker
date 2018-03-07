class AddEventsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :object
      t.string :event_id
      t.string :action
      t.integer :user

      t.timestamps
    end
  end
end

