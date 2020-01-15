class ChangeAmountToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :options, :amount, :float
  end
end
