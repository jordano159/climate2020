class ChangeCivToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :countries, :init_civ, :float
    change_column :countries, :civ_num, :float
  end
end
