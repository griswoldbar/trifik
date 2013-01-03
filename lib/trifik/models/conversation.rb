class Conversation < HashtiveRecord::Base
  #untested
  belongs_to :actor
  
  columns :text
  
  def reply(*utterances)
    result = utterances.inject(text) do |text, utterance|
      response = text.send(utterance.to_sym)
      fish response
    end
  end
  
  private
  
  def fish(response)
    if response.is_a? String
      response
    elsif response.nil?
      actor.no_reply
    else
      hash = response.marshal_dump
      hash[hash.keys.first]
    end
  end
  
end