class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :fax
      t.string :programs
      t.string :handle

      t.timestamps
    end
  end
end
