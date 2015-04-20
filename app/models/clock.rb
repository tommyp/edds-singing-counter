class Clock < ActiveRecord::Base

  scope :latest, -> { where("created_at < ?", Time.zone.now).order("created_at DESC").first}

  def self.reset
    self.latest.update_attribute(:end_time, Time.zone.now)
    Clock.create
  end

  def self.previous_clocks
    # previous_clocks = self.where("end_time")
    # if previous_clocks.any?
    #   previous_clocks.sort! { |a,b| a.end_time - a.created_at <=> b.end_time - a.created_at }
    # else
      []
    # end
  end

end
