class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.timestamp :sent_at
      t.string :from
      t.string :to
      t.string :body
      t.string :status

      t.timestamps null: false
    end
  end
end
