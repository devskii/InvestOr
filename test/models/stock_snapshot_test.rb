require 'test_helper'

class StockSnapshotTest < ActiveSupport::TestCase
  test "is_conservatively_financed" do
    assert stock_snapshots(:aapl).is_conservatively_financed == false
    assert stock_snapshots(:adm).is_conservatively_financed == true
    assert stock_snapshots(:aep).is_conservatively_financed == false
    assert stock_snapshots(:tsla).is_conservatively_financed == true
  end

  test "satisfies_fundamental_rules" do
    assert stock_snapshots(:aapl).satisfies_fundamental_rules == false
    assert stock_snapshots(:adm).satisfies_fundamental_rules == true
    assert stock_snapshots(:aep).satisfies_fundamental_rules == false
    assert stock_snapshots(:tsla).satisfies_fundamental_rules == false
  end

  test "calculate_debt_to_equity_ratio" do
    assert stock_snapshots(:aapl).calculate_debt_to_equity_ratio == 1.78
    assert stock_snapshots(:adm).calculate_debt_to_equity_ratio == 0.55
    assert stock_snapshots(:aep).calculate_debt_to_equity_ratio == 1.56
    assert stock_snapshots(:tsla).calculate_debt_to_equity_ratio == 0.14
  end

  test "calculate_eps_average_past_seven_years" do
    assert stock_snapshots(:aapl).calculate_eps_average_past_seven_years == 3.09
    assert stock_snapshots(:adm).calculate_eps_average_past_seven_years == 2.97
    assert stock_snapshots(:aep).calculate_eps_average_past_seven_years == 3.79
    assert stock_snapshots(:tsla).calculate_eps_average_past_seven_years == -0.18
  end

  test "calculate_eps_average_past_three_years" do
    assert stock_snapshots(:aapl).calculate_eps_average_past_three_years == 3.95
    assert stock_snapshots(:adm).calculate_eps_average_past_three_years == 3.47
    assert stock_snapshots(:aep).calculate_eps_average_past_three_years == 4.43
    assert stock_snapshots(:tsla).calculate_eps_average_past_three_years == 1.52
  end

  test "calculate_eps_average_three_years_at_beginning_of_decade" do
    assert stock_snapshots(:aapl).calculate_eps_average_three_years_at_beginning_of_decade == 1.54
    assert stock_snapshots(:adm).calculate_eps_average_three_years_at_beginning_of_decade == 2.51
    assert stock_snapshots(:aep).calculate_eps_average_three_years_at_beginning_of_decade == 2.99
    assert stock_snapshots(:tsla).calculate_eps_average_three_years_at_beginning_of_decade == -0.44
  end

  test "earnings_percentage_increase_over_decade" do
    assert stock_snapshots(:aapl).earnings_percentage_increase_over_decade == 156
    assert stock_snapshots(:adm).earnings_percentage_increase_over_decade == 38
    assert stock_snapshots(:aep).earnings_percentage_increase_over_decade == 48
    assert stock_snapshots(:tsla).earnings_percentage_increase_over_decade == -445
  end

  test "recommended_max_purchase_price" do
    assert stock_snapshots(:aapl).recommended_max_purchase_price == 77.25
    assert stock_snapshots(:adm).recommended_max_purchase_price == 74.25
    assert stock_snapshots(:aep).recommended_max_purchase_price == 94.75
    assert stock_snapshots(:tsla).recommended_max_purchase_price == -4.50
  end

  test "is_reasonably_priced" do
    assert stock_snapshots(:aapl).is_reasonably_priced == false
    assert stock_snapshots(:adm).is_reasonably_priced == false
    assert stock_snapshots(:aep).is_reasonably_priced == false
    assert stock_snapshots(:tsla).is_reasonably_priced == false
  end

  test "buy?" do
    assert stock_snapshots(:aapl).buy? == false
    assert stock_snapshots(:adm).buy? == false
    assert stock_snapshots(:aep).buy? == false
    assert stock_snapshots(:tsla).is_reasonably_priced == false
  end

  test "sell?" do
    assert stock_snapshots(:aapl).sell? == true
    assert stock_snapshots(:adm).sell? == false
    assert stock_snapshots(:aep).sell? == true
    assert stock_snapshots(:tsla).sell? == true
  end

  test "has_positive_earnings_for_past_ten_years" do
    assert stock_snapshots(:aapl).has_positive_earnings_for_past_ten_years == true
    assert stock_snapshots(:adm).has_positive_earnings_for_past_ten_years == true
    assert stock_snapshots(:aep).has_positive_earnings_for_past_ten_years == true
    assert stock_snapshots(:tsla).has_positive_earnings_for_past_ten_years == false
  end
end
