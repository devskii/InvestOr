class RenameEpsColumnFromThisYearToLastTenYears < ActiveRecord::Migration[7.0]
  def change
    remove_column :stock_snapshots, :eps_this_year
    add_column :stock_snapshots, :eps_10y_ago, :decimal, precision: 4, scale: 2
  end
end
