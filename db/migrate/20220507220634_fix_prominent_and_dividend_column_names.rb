class FixProminentAndDividendColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :stock_snapshots, :prominent?, :is_prominent
    rename_column :stock_snapshots, :dividend?, :has_reliable_dividend
  end
end
