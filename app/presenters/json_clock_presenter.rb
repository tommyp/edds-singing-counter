class JsonClockPresenter
  include ActionView::Helpers::DateHelper

  def initialize(clock)
    @clock = clock
  end

  def to_hash
    {
      updated_at: distance_of_time_in_words_to_now(clock.created_at)
    }
  end

private
  attr_reader :clock

end
