class AddScreenshotColumn < ActiveRecord::Migration[5.1]
  def change
    add_attachment :tickets, :screenshot
  end
end
