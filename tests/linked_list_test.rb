require 'test/unit'
require 'test/unit/ui/console/testrunner'
require '../linked_list'
class LinkedListTest < Test::Unit::TestCase
  SAS_P = "sas"

  def setup
  end

  def test_push_back_and_pop_back
    list=LinkedList.new
    list.insert_back 1
    list.insert_back 2
    assert_equal(list.pop_back, 2)
    assert_equal(list.pop_back, 1)
  end
end

Test::Unit::UI::Console::TestRunner.run(LinkedListTest)