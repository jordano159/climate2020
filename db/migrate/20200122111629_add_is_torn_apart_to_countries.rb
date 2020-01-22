class AddIsTornApartToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :is_torn_apart, :boolean, null: false, default: false
  end
end
