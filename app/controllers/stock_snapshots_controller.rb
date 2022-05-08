class StockSnapshotsController < ApplicationController
  def create
    @stock_snapshot = StockSnapshot.new(ticker: "...")
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
end
