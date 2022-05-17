class CorrectEpsTtmPrecisionAndScale < ActiveRecord::Migration[7.0]
  def change
    change_column :stock_snapshots, :eps_ttm, :decimal, :precision => 4, :scale => 2
  end
end
