class ClockController < ApplicationController

  def index
    @clock = Clock.latest
    if @clock.blank?
      @clock = Clock.create
    end
    @clocks = Clock.previous_clocks

    respond_to do |format|
      format.html
      format.json { render json: JsonClockPresenter.new(@clock) }
    end
  end

  def reset
    Clock.reset
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: { status: 'OK' } }
    end
  end

end
