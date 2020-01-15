class AddBudgetToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :budget, :integer
  end
end
