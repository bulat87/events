class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :recurrence
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
