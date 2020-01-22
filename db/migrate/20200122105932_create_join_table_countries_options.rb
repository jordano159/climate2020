class CreateJoinTableCountriesOptions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :options do |t|
      # t.index [:country_id, :option_id]
      # t.index [:option_id, :country_id]
    end
  end
end
