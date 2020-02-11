class AddConsequenceToEvents < ActiveRecord::Migration[6.0]
  def change
      add_column :events, :amount, :integer
      add_column :events, :on_what, :string
  end
end
