class AddLongtermDebtAgain < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_snapshots, :total_longterm_debt, :integer
  end
end
