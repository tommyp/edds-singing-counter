class Clock < ActiveRecord::Base

  scope :latest, -> { where("created_at < ?", Time.zone.now).order("created_at DESC").first}

  def self.reset
    self.latest.update_attribute(:end_time, Time.zone.now)
    Clock.create
  end

  def self.greatest_hits
    self.where('end_time IS NOT NULL').to_a.sort! { |a,b| a.created_at.to_i - a.end_time.to_i <=> b.created_at.to_i - b.end_time.to_i }
  end

end
