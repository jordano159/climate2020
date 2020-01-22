class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.text :content

      t.timestamps
    end
  end
end
