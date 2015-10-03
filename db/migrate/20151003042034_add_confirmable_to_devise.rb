class AddConfirmableToDevise < ActiveRecord::Migration
  def up
  	add_column :users, :confirmation_token, :string
  	add_column :users, :confirmed_at, :datetime
  	add_column :users, :confirmation_sent_at, :datetime
  	add_index :users, :confirmation_token, unique: true
  end

  def down
  	remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
