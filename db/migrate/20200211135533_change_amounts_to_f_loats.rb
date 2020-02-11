class ChangeAmountsToFLoats < ActiveRecord::Migration[6.0]
  def change
    change_column :options, :amount2, :float
    change_column :events, :amount, :float
  end
end
