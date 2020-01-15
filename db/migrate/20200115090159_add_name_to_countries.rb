class AddNameToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :name, :string
  end
end
