class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status_text
      t.string :creator
      t.string :remote_id, :unique => true
      
      t.timestamps
    end
  end
end
