class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, null: false, default: "無題"
      t.integer :limit
      t.string :number
      t.integer :status, null: false, default: 1
      t.integer :bet, null: false, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
