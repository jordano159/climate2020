class RemoveOperatorFromOptions < ActiveRecord::Migration[6.0]
  def change

    remove_column :options, :operator, :integer
  end
end
