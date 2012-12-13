class Item < HashtiveRecord::Base
  include Trifik::Model
  
  belongs_to :container, polymorphic: true

  def zone
    container.zone
  end

end