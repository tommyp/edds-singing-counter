class ClockController < ApplicationController

  def index
    @clock = Clock.latest
    if @clock.blank?
      @clock = Clock.create
    end
    @clocks = Clock.previous_clocks
  end

  def reset
    Clock.reset
    redirect_to root_path
  end

end
