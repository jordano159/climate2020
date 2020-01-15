class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :title
      t.integer :operator
      t.integer :amount
      t.string :on_what
      t.references :event, null: false, foreign_key: true
      t.integer :min_resilience
      t.integer :min_budget
      t.float :min_civ_num
      t.integer :min_reg_rel
      t.integer :min_agriculture
      t.integer :min_education
      t.integer :min_security
      t.integer :min_comms
      t.integer :min_social_sec
      t.integer :min_health
      t.integer :min_water
      t.integer :min_energy

      t.timestamps
    end
  end
end
