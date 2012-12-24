class Ticker

  attr_accessor :observers, :ticks
  
  def initialize
    @observers = []
    @ticks = 0
  end
  
  def tick
    notify_observers
    self.ticks += 1
  end
  
  def add_observer(thing)
    self.observers << thing
  end
  
  private
  
  def notify_observers
    observers.each(&:update)
  end

end