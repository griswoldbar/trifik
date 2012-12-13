module Tickable

  def self.included(base)
    base.send(:define_singleton_method, :extended) do |thing|
      thing.make_tickable(thing.ticker)
    end
  end
  
  def make_tickable(ticker)
    unless tickable?
      define_callback
      ticker.add_observer(record)
      record.tickable = true
    end
  end
  
  def tock
    true
  end
  
  private
  def tickable?
    record.respond_to?(:tickable) && record.tickable == true
  end
  
  def define_callback
    _klass = self.class
    record.send(:define_singleton_method, :update) do
      thing = _klass.instantiate(self)
      thing.tock
    end
  end
  
end