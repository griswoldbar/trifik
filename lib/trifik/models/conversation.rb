class Conversation < HashtiveRecord::Base
  #untested
  
  class ResponseNotFound < Exception; end
  
  belongs_to :actor
  
  columns :prompts

  #multiple prompts could yield same answer... where to deal wtih? in yaml?
  def reply(*utterances)
    utterances.inject(self) do |conversation, utterance|
      prompt = conversation.prompts.find {|p| p.respond_to?(utterance) }
      !!prompt ? prompt.send(utterance) : raise(ResponseNotFound)
    end.response
  rescue ResponseNotFound
    actor.no_reply
  end
  
end