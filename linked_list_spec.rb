require './linked_list'

describe "LinkedList" do
  let(:list_element3) { ListElement.new(nil, "foo") }
  let(:list_element2) { ListElement.new(list_element3, "bar") }
  let(:list_element1) { ListElement.new(list_element2, "goo") }
  let(:linked_list) { LinkedList.new(list_element1) }

  describe "initialize" do
    let(:list_element) { double(ListElement) }

    it "sets the initalize argument as the head of the list" do
      ll = LinkedList.new(list_element)
      ll.head.should == list_element
    end
  end

  describe "#find_element" do
    context "return_previous is set to true" do
      it "returns the previous element of the found element" do
        linked_list.find_element(list_element3.data, true).should == list_element2
      end
    end

    context "return_previous is set to false" do
      it "returns the found element" do
        linked_list.find_element(list_element3.data, false).should == list_element3
      end
    end
  end

  describe "#delete_element" do
    context "from the POV of the deleted element" do
      it "calls find_element with return_previous set to true" do
        linked_list.should_receive(:find_element).with("bar", true).and_call_original
        linked_list.delete_element("bar")
      end

      it "sets the previous elements pointer to point to it's next_element" do
        linked_list.delete_element("bar")
        list_element1.next_el.should == list_element3
      end

      it "sets its next_el to nil" do
        linked_list.delete_element("bar")
        list_element2.next_el.should == nil
      end
    end
  end

  describe ".delete_list" do
    it ""
  end
end