class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.decimal :positivity_followers_r
      t.decimal :positivity_stdv

      t.timestamps
    end
  end
end
