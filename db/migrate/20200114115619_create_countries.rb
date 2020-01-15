class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.integer :resilience
      t.integer :init_civ
      t.integer :civ_num
      t.float :deg
      t.integer :life_level
      t.integer :score
      t.integer :year
      t.integer :reg_rel
      t.boolean :is_conquered
      t.integer :agriculture
      t.integer :education
      t.integer :security
      t.integer :comms
      t.integer :social_sec
      t.integer :health
      t.integer :water
      t.integer :energy

      t.timestamps
    end
  end
end
