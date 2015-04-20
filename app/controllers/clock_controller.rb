class ClockController < ApplicationController

  def index
    @clock = Clock.latest
    if @clock.nil?
      @clock = Clock.create!(start_time: Time.zone.now)
    end
    @clocks = Clock.previous_clocks
  end

  def reset
    Clock.reset
    redirect_to root_path
  end

end
