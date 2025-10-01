class BirdCount
  def self.last_week
    last_week=[0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @birds = birds_per_day
  end

  def yesterday
    @birds[-2]
  end

  def total
    total = @birds.sum
  end

  def busy_days
    busy_days=0
    @birds.each do |bird|
      if bird >= 5
        busy_days+=1
      end
    end
    return busy_days
  end

  def day_without_birds?
    if @birds.count(0) >= 1
      return true
    else
      return false
    end
  end
end
