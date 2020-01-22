class CreateJoinTableCountriesEvents < ActiveRecord::Migration[6.0]
  def change
    create_join_table :countries, :events do |t|
      # t.index [:country_id, :event_id]
      # t.index [:event_id, :country_id]
    end
  end
end
