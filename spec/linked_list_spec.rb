require 'rspec'
require 'linked_list'

describe LinkedList do
  describe 'insert_back' do
    context "one insert_back" do
      it "return inserted object back and forth" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 3
        expect(list.pop_front).to eq 3

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 3
        expect(list.pop_back).to eq 3
      end
    end

    context "two insert_back" do
      it "pop_front return already given " do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect(list.pop_front).to eq 1
      end

      it "pop_back returns the newly inserted " do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2

        expect(list.pop_back).to eq 2
      end
    end

    context "three insert back" do
      it "pop_front returns the first element" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect(list.is_empty?).to eq false
        list.insert_back 3

        expect(list.pop_front).to eq 1
      end

      it "pop_back returns the newly inserted element" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect(list.is_empty?).to eq false
        list.insert_back 3

        expect(list.pop_back).to eq 3
      end
    end
  end

  describe 'insert_front' do
    context "one insert front" do
      it "return inserted object back and forth" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 3
        expect(list.pop_front).to eq 3

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 3
        expect(list.pop_back).to eq 3
      end
    end

    context "two insert_front" do
      it "pop_front return second inserted object" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.pop_front).to eq 2
      end

      it "pop_back return first inserted object" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.pop_back).to eq 1
      end
    end

    context "three insert_front" do
      it "pop_front return last inserted object" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.is_empty?).to eq false
        list.insert_front 3
        expect(list.pop_front).to eq 3
      end

      it "pop_back return first inserted object" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.is_empty?).to eq false
        list.insert_front 3
        expect(list.pop_back).to eq 1
      end
    end
  end

  describe 'pop_front' do
    context "empty list" do
      it "raise error" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        expect{ list.pop_front }.to raise_exception "empty"
      end
    end

    context "one item list" do
      it "returns the only item" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 3
        expect(list.pop_front).to eq 3

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 3
        expect(list.pop_front).to eq 3
      end
    end

    context "two item list" do
      it "returns the first item" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect(list.pop_front).to eq 1
        expect(list.pop_front).to eq 2

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.pop_front).to eq 2
        expect(list.pop_front).to eq 1

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect(list.pop_front).to eq 2
        expect(list.pop_front).to eq 1

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect( list.pop_front ).to eq 1
        expect( list.pop_front ).to eq 2
      end
    end
  end

  describe 'pop_back' do
    context "empty list" do
      it "raise error" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        expect{ list.pop_back }.to raise_exception "empty"
      end
    end

    context "one item list" do
      it "returns the only item" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 3
        expect( list.pop_back ).to eq 3

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 3
        expect( list.pop_back ).to eq 3
      end
    end

    context "two item list" do
      it "returns the first item" do
        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect( list.pop_back ).to eq 2
        expect( list.pop_back ).to eq 1

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect( list.pop_back ).to eq 1
        expect( list.pop_back ).to eq 2

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_back 1
        expect(list.is_empty?).to eq false
        list.insert_front 2
        expect( list.pop_back ).to eq 1
        expect( list.pop_back ).to eq 2

        list = LinkedList.new
        expect(list.is_empty?).to eq true
        list.insert_front 1
        expect(list.is_empty?).to eq false
        list.insert_back 2
        expect( list.pop_back ).to eq 2
        expect( list.pop_back ).to eq 1
      end
    end
  end
end

