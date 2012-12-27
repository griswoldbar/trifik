module Presenter
  extend self

  def header(text)
    l=text.length + 2
    ("=" * l) + "\n" + " #{text}\n" + ("=" * l)
  end
  
end