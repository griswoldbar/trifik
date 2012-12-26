class Item < HashtiveRecord::Base
  include Trifik::Model
  
  belongs_to :container, polymorphic: true

  def zone
    container.zone
  end

  private
  def not_possessed_message
    "You don't have a #{name}!"
  end
  
  def not_present_message
    "You can't see a #{name} here!"
  end
end