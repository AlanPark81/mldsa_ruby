require 'rspec'
require 'stack'

describe Stack do
  describe "front" do
    context "empty" do
      it 'should raise empty' do
        stack = Stack.new
        expect{ stack.front }.to raise_exception "empty"
      end
    end

    context "one item in stack" do
      it 'should return the item and keep the size 1' do
        stack = Stack.new
        stack.push 1
        expect(stack.size).to be 1
        expect(stack.front).to be 1
        expect(stack.size).to be 1
      end
    end

    context "two item in stack" do
      it 'should return the first-pushed item and keep the size 2' do
        stack = Stack.new
        stack.push 1
        stack.push 2
        expect(stack.size).to be 2
        expect(stack.front).to be 1
        expect(stack.size).to be 2
      end
    end

    context "three item in stack" do
      it 'should return the first-pushed item and keep the size 3' do
        stack = Stack.new
        stack.push 1
        stack.push 2
        stack.push 3
        expect(stack.size).to be 3
        expect(stack.front).to be 1
        expect(stack.size).to be 3
      end
    end
  end
  describe "push and pop" do
    context "empty" do
      it 'should raise empty' do
        stack = Stack.new
        expect{ stack.pop }.to raise_exception "empty"
      end
    end

    context "one item in stack" do
      it 'should return the item and the size decreases to 0' do
        stack = Stack.new
        stack.push 1
        expect(stack.size).to be 1
        expect(stack.pop).to be 1
        expect(stack.size).to be 0
      end
    end

    context "two item in stack" do
      it 'should return the first-pushed item and the size decreases to 1' do
        stack = Stack.new
        stack.push 1
        stack.push 2
        expect(stack.size).to be 2
        expect(stack.pop).to be 1
        expect(stack.size).to be 1
        expect(stack.pop).to be 2
        expect(stack.size).to be 0
      end
    end

    context "three item in stack" do
      it 'should return the first-pushed item and the size decreases to 2' do
        stack = Stack.new
        stack.push 1
        stack.push 2
        stack.push 3
        expect(stack.size).to be 3
        expect(stack.pop).to be 1
        expect(stack.size).to be 2
        expect(stack.pop).to be 2
        expect(stack.size).to be 1
        expect(stack.pop).to be 3
        expect(stack.size).to be 0
      end
    end
  end
end