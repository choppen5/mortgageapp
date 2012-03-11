class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :story, :string

    add_column :users, :company_id, :integer

    add_column :users, :zipcode, :string

    add_column :users, :status, :string

  end
end
