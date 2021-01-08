class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :count, default: 0
      t.boolean :clear, default: false
      t.boolean :fin, default: false

      t.timestamps
    end
  end
end
