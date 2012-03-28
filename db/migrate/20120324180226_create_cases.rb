class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text :description
      t.text :status
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
