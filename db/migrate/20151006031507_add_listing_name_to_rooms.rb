class AddListingNameToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :listing_name, :string
  end
end
