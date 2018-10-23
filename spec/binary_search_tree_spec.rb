require 'rspec'
require 'binary_search_tree'

describe BinarySearchTree do
  describe 'insert_contains' do
    context "empty" do
      it 'should raise empty' do
        bst = BinarySearchTree.new
        expect(bst.contains 1).to eq false
      end
    end

    context "one item in bst" do
      it 'can find the item' do
        bst = BinarySearchTree.new
        bst.insert 1
        expect(bst.contains 1).to eq true
        expect( bst.size ).to eq 1
      end
    end

    context "two item in bst" do
      it 'can find both of the items' do
        bst = BinarySearchTree.new
        bst.insert 4
        bst.insert 3
        expect(bst.size).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 4
        expect( bst.size ).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true
      end
    end

    context "three item in bst" do
      it 'should return the first-pushed item and the size decreases to 2' do
        bst = BinarySearchTree.new
        bst.insert 1
        bst.insert 2
        bst.insert 3
        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 2
        bst.insert 3
        bst.insert 1
        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 2
        bst.insert 1

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 2
        bst.insert 1
        bst.insert 3

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 1
        bst.insert 3
        bst.insert 2

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 1
        bst.insert 2

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true
      end
    end
  end

  describe 'insert_contains_remove' do
    context "the only one item is removed in bst" do
      it 'does not contain the item' do
        bst = BinarySearchTree.new
        bst.insert 1
        expect(bst.contains 1).to eq true
        expect( bst.size ).to eq 1
        expect( bst.remove 1 ).to eq true
        expect( bst.contains 1).to eq false
        expect( bst.size ).to eq 0
      end
    end

    context "one of two items in bst is removed" do
      it 'can only find another items' do
        bst = BinarySearchTree.new
        bst.insert 4
        bst.insert 3
        expect( bst.size ).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true
        expect( bst.remove 3 ).to eq true
        expect( bst.size ).to eq 1
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq false
        expect(bst.remove 3).to eq false
        expect(bst.remove 4).to eq true


        bst = BinarySearchTree.new
        bst.insert 4
        bst.insert 3
        expect( bst.size ).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true
        expect(bst.remove 4).to eq true
        expect( bst.size ).to eq 1
        expect(bst.contains 4).to eq false
        expect(bst.contains 3).to eq true
        expect(bst.remove 4).to eq false
        expect(bst.remove 3).to eq true


        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 4
        expect( bst.size ).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true
        expect(bst.remove 4).to eq true
        expect( bst.size ).to eq 1
        expect(bst.contains 4).to eq false
        expect(bst.contains 3).to eq true
        expect(bst.remove 4).to eq false
        expect(bst.remove 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 4
        expect( bst.size ).to eq 2
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq true
        expect(bst.remove 3).to eq true
        expect( bst.size ).to eq 1
        expect(bst.contains 4).to eq true
        expect(bst.contains 3).to eq false
        expect(bst.remove 3).to eq false
        expect(bst.remove 4).to eq true
      end
    end

    context "three item in bst" do
      it 'should return the first-pushed item and the size decreases to 2' do
        bst = BinarySearchTree.new
        bst.insert 1
        bst.insert 2
        bst.insert 3
        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 2
        bst.insert 3
        bst.insert 1
        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 2
        bst.insert 1

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 2
        bst.insert 1
        bst.insert 3

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 1
        bst.insert 3
        bst.insert 2

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true

        bst = BinarySearchTree.new
        bst.insert 3
        bst.insert 1
        bst.insert 2

        expect( bst.size ).to eq 3
        expect(bst.contains 1).to eq true
        expect(bst.contains 2).to eq true
        expect(bst.contains 3).to eq true
      end
    end
  end
end