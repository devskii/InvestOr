class AddSector < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_snapshots, :sector, :string
  end
end
