class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status_text
      t.string :creator

      t.timestamps
    end
  end
end
