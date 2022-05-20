class AddTwentyYearDividendColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_snapshots, :has_reliable_dividend_over_the_past_20_years, :boolean
  end
end
