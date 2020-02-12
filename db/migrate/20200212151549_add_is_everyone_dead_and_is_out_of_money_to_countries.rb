class AddIsEveryoneDeadAndIsOutOfMoneyToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :is_everyone_dead, :boolean, null: false, default: false
    add_column :countries, :is_out_of_money, :boolean, null: false, default: false
  end
end
