class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :case_id
      t.text :content
      t.string :activity_type

      t.timestamps
    end
  end
end
