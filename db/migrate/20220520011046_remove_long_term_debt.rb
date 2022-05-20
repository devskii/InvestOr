class RemoveLongTermDebt < ActiveRecord::Migration[7.0]
  def change
    remove_column :stock_snapshots, :total_longterm_debt
  end
end
