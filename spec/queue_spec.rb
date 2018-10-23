require 'rspec'
require 'queue'

describe Queue do
  describe "front" do
    context "empty queue" do
      it "raise empty" do
        queue=Queue.new
        expect{ queue.front }.to raise_error "empty"
      end
    end

    context "one item queue" do
      it "returns the item" do
        queue=Queue.new
        queue.enqueue 3
        expect(queue.front).to eq 3
      end
    end

    context "two item queue" do
      it "returns the first item" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        expect(queue.front).to eq 3
      end
    end

    context "three item queue" do
      it "returns the first item" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        queue.enqueue 5
        expect(queue.front).to eq 3
      end
    end
  end

  describe "enqueue and dequeue" do
    context "empty queue" do
      it "raise empty" do
        queue=Queue.new
        expect{ queue.dequeue }.to raise_error "empty"
      end
    end

    context "one item queue" do
      it "returns the item" do
        queue=Queue.new
        queue.enqueue 3
        expect(queue.dequeue).to eq 3
      end
    end

    context "two item queue" do
      it "returns the first item" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        expect(queue.dequeue).to eq 3
      end
    end

    context "three item queue" do
      it "returns the first item" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        queue.enqueue 5
        expect(queue.dequeue).to eq 3
      end
    end
  end

  describe "size" do
    context "empty queue" do
      it "returns zero" do
        queue=Queue.new
        expect(queue.size).to be 0
      end
    end

    context "one item queue" do
      it "returns one" do
        queue=Queue.new
        queue.enqueue 3
        expect(queue.size).to eq 1
      end
    end

    context "two item queue" do
      it "returns two" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        expect(queue.size).to eq 2
      end
    end

    context "three item queue" do
      it "returns three" do
        queue=Queue.new
        queue.enqueue 3
        queue.enqueue 4
        queue.enqueue 5
        expect(queue.size).to eq 3
      end
    end
  end
end