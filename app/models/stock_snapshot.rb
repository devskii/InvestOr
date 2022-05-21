class StockSnapshot < ApplicationRecord
    def buy?
        satisfies_fundamental_rules && is_reasonably_priced
    end

    def sell?
        !satisfies_fundamental_rules
    end

    def satisfies_fundamental_rules
        is_large &&
        is_prominent &&
        is_conservatively_financed &&
        has_reliable_dividend_over_the_past_10_years
    end

    def is_conservatively_financed
        calculate_debt_to_equity_ratio <= 1
    end

    def calculate_debt_to_equity_ratio
        (total_debt.to_f / total_equity.to_f).round(2)
    end

    def calculate_eps_average_past_seven_years
        ((eps_last_year + eps_2y_ago + eps_3y_ago + eps_4y_ago + eps_5y_ago + eps_6y_ago + eps_7y_ago) / 7).round(2)
    end

    def calculate_eps_average_past_three_years
        ((eps_last_year + eps_2y_ago + eps_3y_ago) / 3).round(2)
    end

    def calculate_eps_average_three_years_at_beginning_of_decade
        ((eps_8y_ago + eps_9y_ago + eps_10y_ago) / 3).round(2)
    end

    def current_ratio
        (total_current_assets.to_f / total_current_liabilities.to_f).round(2)
    end

    def earnings_percentage_increase_over_decade
        start = calculate_eps_average_three_years_at_beginning_of_decade
        finish = calculate_eps_average_past_three_years
        
        ((finish - start) / start).round(2) * 100
    end

    def recommended_max_purchase_price
        price_limit_long = 25 * calculate_eps_average_past_seven_years
        price_limit_short = 20 * eps_ttm

        [price_limit_long, price_limit_short].min
    end

    def has_excellent_price_based_on_3yr_earnings
        market_price <= 15 * calculate_eps_average_past_three_years
    end

    def has_positive_earnings_for_past_ten_years
        [
            eps_ttm,
            eps_last_year,
            eps_2y_ago,
            eps_3y_ago,
            eps_4y_ago,
            eps_5y_ago,
            eps_6y_ago,
            eps_7y_ago,
            eps_8y_ago,
            eps_9y_ago,
            eps_10y_ago,
        ].reduce(true) { |union, eps| union && eps >= 0 }
    end

    def is_reasonably_priced
        market_price <= recommended_max_purchase_price
    end
end
