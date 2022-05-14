class AddTotalDebt < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_snapshots, :total_debt, :integer
  end
end
