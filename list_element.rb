class ListElement
  attr_accessor :next_el, :data

  def initialize(next_el, data)
    @next_el = next_el
    @data = data
  end
end