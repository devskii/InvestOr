require 'test_helper'

class StockSnapshotTest < ActiveSupport::TestCase
  test "total_capitalization" do
    assert stock_snapshots(:aapl).total_capitalization == 170722
    assert stock_snapshots(:adm).total_capitalization == 32474
    assert stock_snapshots(:aep).total_capitalization == 54702
  end

  test "is_conservatively_financed" do
    assert stock_snapshots(:aapl).is_conservatively_financed == false
    assert stock_snapshots(:adm).is_conservatively_financed == true
    assert stock_snapshots(:aep).is_conservatively_financed == false
  end

  test "satisfies_fundamental_rules" do
    assert stock_snapshots(:aapl).satisfies_fundamental_rules == false
    assert stock_snapshots(:adm).satisfies_fundamental_rules == true
    assert stock_snapshots(:aep).satisfies_fundamental_rules == false
  end

  test "calculate_debt_to_equity_ratio" do
    assert stock_snapshots(:aapl).calculate_debt_to_equity_ratio == 1.78
    assert stock_snapshots(:adm).calculate_debt_to_equity_ratio == 0.55
    assert stock_snapshots(:aep).calculate_debt_to_equity_ratio == 1.56
  end

  test "calculate_eps_average_past_seven_years" do
    assert stock_snapshots(:aapl).calculate_eps_average_past_seven_years == 3.09
    assert stock_snapshots(:adm).calculate_eps_average_past_seven_years == 2.97
  end

  test "is_reasonably_priced" do
    assert stock_snapshots(:aapl).is_reasonably_priced == false
    assert stock_snapshots(:adm).is_reasonably_priced == false
  end

  test "buy?" do
    assert stock_snapshots(:aapl).buy? == false
    assert stock_snapshots(:adm).buy? == false
  end

  test "sell?" do
    assert stock_snapshots(:aapl).sell? == true
    assert stock_snapshots(:adm).sell? == false
  end
end
