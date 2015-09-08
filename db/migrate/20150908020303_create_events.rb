class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :owner
      t.time :date
      t.time :deadline
      t.text :detail

      t.timestamps null: false
    end
  end
end
