class RemoveMarketCap < ActiveRecord::Migration[7.0]
  def change
    remove_column :stock_snapshots, :market_cap
    remove_column :stock_snapshots, :shareholder_equity_in_common_stock
  end
end
