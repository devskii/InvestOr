class StockSnapshotsController < ApplicationController
  def index
    @stock_snapshots = StockSnapshot.all
  end

  def show
    @stock_snapshot = StockSnapshot.find(params[:id])
  end
end
