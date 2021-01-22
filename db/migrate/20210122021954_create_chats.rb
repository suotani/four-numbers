class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :message
      t.integer :room_id
      t.string :speaker

      t.timestamps
    end
  end
end
