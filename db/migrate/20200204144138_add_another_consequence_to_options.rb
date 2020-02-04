class AddAnotherConsequenceToOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :options, :amount2, :integer
    add_column :options, :on_what2, :string
  end
end
