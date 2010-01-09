#######################################################################
# test_hashslice.rb
#
# Test suite for the hashslice library. You should run these tests
# via the 'rake test' task.
#######################################################################
require 'rubygems'
gem 'test-unit'

require 'hashslice'
require 'test/unit'

class TC_Hashslice < Test::Unit::TestCase
   def setup
      @hash = {'a' => 1, 'b' => 2}
   end

   def test_version
      assert_equal('1.0.7', Hash::VERSION_HASHSLICE)      
   end
   
   def test_get_slice_instance_method_basic
      assert_respond_to(@hash, :[])
      assert_nothing_raised{ @hash['a'] }
      assert_nothing_raised{ @hash['a', 'b'] }
      assert_kind_of(Integer, @hash['a'])
      assert_kind_of(Array, @hash['a', 'b'])
   end

   def test_get_slice_instance_method
      assert_equal(1, @hash['a'])
      assert_equal([1, 2], @hash['a', 'b'])
      assert_equal([1, 2, nil], @hash['a', 'b', 'c'])
      assert_nil(@hash['bogus'])
   end

   def test_get_slice_duplicate_keys
      assert_equal([1, 1], @hash['a', 'a'])
      assert_equal([1, 2, 1, 2], @hash['a', 'b', 'a', 'b'])
   end

   def test_set_slice_instance_method_basic
      assert_respond_to(@hash, :[]=)
      assert_nothing_raised{ @hash['a'] = 3 }
      assert_nothing_raised{ @hash['a', 'b'] = 3 }
      assert_nothing_raised{ @hash['a', 'b'] = 3, 4 }
      assert_kind_of(Fixnum, @hash['a'] = 3)
      assert_kind_of(Fixnum, @hash['a', 'b'] = 3)
      assert_kind_of(Fixnum, @hash['a', 'b'] = 3, 4)
   end

   # hash[key] = value
   def test_set_slice_instance_method_single_key_and_value
      assert_nothing_raised{ @hash['a'] = 3 }
      assert_nothing_raised{ @hash['b'] = [1, 2] }
      assert_equal({'a' => 3, 'b' => [1, 2]}, @hash)
   end

   # hash[key1, key2] = value
   def test_set_slice_instance_method_multiple_keys_single_value
      assert_nothing_raised{ @hash['a', 'b'] = 3 }
      assert_equal({'a' => 3, 'b' => nil}, @hash)
   end

   # hash[key1, key2] = value1, value2
   def test_set_slice_instance_method_multiple_keys_multiple_values
      assert_nothing_raised{ @hash['a', 'b'] = 3, 4 }
      assert_equal({'a' => 3, 'b' => 4}, @hash)
   end

   # hash[key] = value1, value2
   def test_set_slice_instance_method_single_key_multiple_values
      assert_nothing_raised{ @hash['a'] = 3, 4 }
      assert_equal({'a' => [3, 4], 'b' => 2}, @hash)
   end

   # hash[key1, key2] = value1, value2, value3
   def test_set_slice_instance_method_multiple_keys_odd_values
      assert_nothing_raised{ @hash['a', 'b'] = 3, 4, 5 }
      assert_equal({'a' => 3, 'b' => 4}, @hash)
   end

   def test_slice_alias
      assert_true(Hash.instance_method(:slice) == Hash.instance_method(:[]))
   end
   
   def test_hash_of
      assert_respond_to(@hash, :hash_of)
      assert_equal({'a' => 1, 'b' => 2}, @hash.hash_of('a', 'b'))      
   end

   def teardown
      @hash = nil
   end
end
