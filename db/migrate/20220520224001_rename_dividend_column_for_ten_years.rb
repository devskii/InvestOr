class RenameDividendColumnForTenYears < ActiveRecord::Migration[7.0]
  def change
    rename_column :stock_snapshots, :has_reliable_dividend, :has_reliable_dividend_over_the_past_10_years
  end
end
