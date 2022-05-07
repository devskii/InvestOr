# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_07_220634) do
  create_table "stock_snapshots", force: :cascade do |t|
    t.string "ticker"
    t.boolean "is_prominent"
    t.boolean "has_reliable_dividend"
    t.integer "total_assets"
    t.integer "total_intangibles"
    t.integer "total_goodwill"
    t.integer "total_current_assets"
    t.integer "total_liabilities"
    t.integer "total_longterm_debt"
    t.integer "total_current_liabilities"
    t.integer "market_cap"
    t.decimal "market_price", precision: 8, scale: 2
    t.decimal "eps_this_year", precision: 4, scale: 2
    t.decimal "eps_last_year", precision: 4, scale: 2
    t.decimal "eps_2y_ago", precision: 4, scale: 2
    t.decimal "eps_3y_ago", precision: 4, scale: 2
    t.decimal "eps_4y_ago", precision: 4, scale: 2
    t.decimal "eps_5y_ago", precision: 4, scale: 2
    t.decimal "eps_6y_ago", precision: 4, scale: 2
    t.decimal "eps_7y_ago", precision: 4, scale: 2
    t.decimal "eps_8y_ago", precision: 4, scale: 2
    t.decimal "eps_9y_ago", precision: 4, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
