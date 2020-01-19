class CreateMinisters < ActiveRecord::Migration[6.0]
  def change
    create_table :ministers do |t|
      t.string :role
      t.text :description

      t.timestamps
    end
  end
end
