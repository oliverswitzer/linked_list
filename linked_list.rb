require './list_element'
require 'pry'

class LinkedList
  attr_accessor :head

  def self.delete_list(head_el)
  end

  def initialize(head)
    @head = head
  end

  def find_element(el, return_previous=false)
    current_element = head
    find_condition = return_previous ?
                      "current_element.next_el.data != '#{el}'" :
                      "current_element.data != '#{el}'"

    while eval(find_condition) && current_element.next_el != nil
      current_element = current_element.next_el
    end
    current_element
  end

  def delete_element(el)
    @head = @head.next_el if @head.data == el

    previous_element = find_element(el, return_previous = true)

    to_delete = previous_element.next_el

    link(previous_element, to_delete.next_el)
    link(to_delete, nil)
  end

  private

    def link(el1, el2)
      el1.next_el = el2
    end
end
