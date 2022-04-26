class CreateStockSnapshots < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_snapshots do |t|
      t.string :ticker
      t.boolean :prominent?
      t.boolean :dividend?
      t.integer :total_assets
      t.integer :total_intangibles
      t.integer :total_goodwill
      t.integer :total_current_assets
      t.integer :total_liabilities
      t.integer :total_longterm_debt
      t.integer :total_current_liabilities
      t.integer :market_cap
      t.decimal :market_price, precision: 8, scale: 2
      t.decimal :eps_this_year, precision: 4, scale: 2
      t.decimal :eps_last_year, precision: 4, scale: 2
      t.decimal :eps_2y_ago, precision: 4, scale: 2
      t.decimal :eps_3y_ago, precision: 4, scale: 2
      t.decimal :eps_4y_ago, precision: 4, scale: 2
      t.decimal :eps_5y_ago, precision: 4, scale: 2
      t.decimal :eps_6y_ago, precision: 4, scale: 2
      t.decimal :eps_7y_ago, precision: 4, scale: 2
      t.decimal :eps_8y_ago, precision: 4, scale: 2
      t.decimal :eps_9y_ago, precision: 4, scale: 2

      t.timestamps
    end
  end
end
