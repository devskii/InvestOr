class AddColumnsForLargeAndConservativeFinancingCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_snapshots, :common_stock, :integer
    add_column :stock_snapshots, :eps_ttm, :integer
    add_column :stock_snapshots, :is_large, :boolean
    add_column :stock_snapshots, :shareholder_equity_in_common_stock, :integer
    add_column :stock_snapshots, :total_common_shares_outstanding, :integer
    add_column :stock_snapshots, :total_equity, :integer
  end
end
