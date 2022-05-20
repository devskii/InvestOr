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
        has_reliable_dividend
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

    def is_reasonably_priced
        (market_price <= 20 * eps_ttm) &&
        (market_price <= 25 * calculate_eps_average_past_seven_years)
    end
end
