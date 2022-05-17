class StockSnapshotsController < ApplicationController
  def create
    @stock_snapshot = StockSnapshot.new(stock_snapshot_params)
    if @stock_snapshot.save
      redirect_to @stock_snapshot
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def index
    @stock_snapshots = StockSnapshot.all
  end

  def new
    @stock_snapshot = StockSnapshot.new
  end

  def show
    @stock_snapshot = StockSnapshot.find(params[:id])
  end

  private
    def stock_snapshot_params
      params.require(:stock_snapshot).permit(
        :common_stock,
        :ticker,
        :is_large,
        :is_prominent,
        :has_reliable_dividend,
        :total_assets,
        :total_debt,
        :total_equity,
        :total_intangibles,
        :total_goodwill,
        :total_current_assets,
        :total_liabilities,
        :total_longterm_debt,
        :total_common_shares_outstanding,
        :total_current_liabilities,
        :market_price,
        :eps_ttm,
        :eps_last_year,
        :eps_2y_ago,
        :eps_3y_ago,
        :eps_4y_ago,
        :eps_5y_ago,
        :eps_6y_ago,
        :eps_7y_ago,
        :eps_8y_ago,
        :eps_9y_ago,
        :eps_10y_ago
      )
    end
end
