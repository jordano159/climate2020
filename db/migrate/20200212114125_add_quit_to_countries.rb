class AddQuitToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :quit, :boolean, null: false, default: false
  end
end
