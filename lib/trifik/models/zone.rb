class Zone < HashtiveRecord::Base
  has_many :rooms
  
  def ticker
    (record.respond_to? :ticker) ? record.ticker : record.ticker = Ticker.new 
  end
  
end