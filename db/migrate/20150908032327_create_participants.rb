class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :user_name
      t.column :status, :enum, :limit => [:participated, :cancelled, :unanswered], :default => :unanswered
      t.timestamps null: false
    end
  end
end
