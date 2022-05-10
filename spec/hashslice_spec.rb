#######################################################################
# hashslice_spec.rb
#
# Test suite for the hashslice library. You should run these tests
# via the 'rake spec' task.
#######################################################################
require 'hashslice'
require 'rspec'

RSpec.describe Hash do
  before do
    @hash = {'a' => 1, 'b' => 2}
  end

  example 'version' do
    expect(Hash::VERSION_HASHSLICE).to eq('1.2.0')
    expect(Hash::VERSION_HASHSLICE).to be_frozen
  end

  example 'Hash#[] basic functionality' do
    expect(@hash).to respond_to(:[])
    expect{ @hash[] }.not_to raise_error
  end

  example 'Hash#[] returns the expected value for a single argument' do
    expect(@hash['a']).to eq(1)
    expect(@hash['b']).to eq(2)
    expect(@hash['c']).to be(nil)
  end

  example 'Hash#[] returns the expected value for multiple arguments' do
    expect(@hash['a', 'b']).to eq([1, 2])
    expect(@hash['b', 'a']).to eq([2, 1])
    expect(@hash['a', 'b', 'c']).to eq([1, 2, nil])
  end

  example 'Hash#[] returns the expected value for duplicate arguments' do
    expect(@hash['a', 'a']).to eq([1, 1])
    expect(@hash['a', 'b', 'a', 'b']).to eq([1, 2, 1, 2])
    expect(@hash['a', 'a', 'c', 'c']).to eq([1, 1, nil, nil])
  end

  example 'Hash#[]= basic functionality' do
    expect(@hash).to respond_to(:[]=)
    expect{ @hash['a'] = 3 }.not_to raise_error
    expect{ @hash['a', 'b'] = 3 }.not_to raise_error
    expect{ @hash['a', 'b'] = [3, 4] }.not_to raise_error
  end

  example 'Hash#[]= with a single key and single value works as expected' do
    expect(@hash['a'] = 3).to eq(3)
    expect(@hash['a']).to eq(3)
    expect(@hash['b'] = [4, 5]).to eq([4, 5])
    expect(@hash['b']).to eq([4, 5])
  end

  example 'Hash#[]= with a multiple keys and single value works as expected' do
    expect(@hash['a', 'b'] = 3).to eq(3)
    expect(@hash['a', 'b']).to eq([3, nil])
  end

  example 'Hash#[]= with a multiple keys and multiple values works as expected' do
    expect(@hash['a', 'b'] = [3, 4]).to eq([3, 4])
    expect(@hash['a', 'b']).to eq([3, 4])
  end

  example 'Hash#[]= with a multiple keys and an odd number of values works as expected' do
    expect{ @hash['a', 'b'] = 3, 4, 5 }.not_to raise_error
    expect(@hash).to eq({'a' => 3, 'b' => 4})
  end

  example 'slice_alias' do
    expect(Hash.instance_method(:slice)).to eql(Hash.instance_method(:[]))
  end

  example 'hash_of returns a sub hash' do
    expect(@hash).to respond_to(:hash_of)
    expect(@hash.hash_of('a', 'b')).to eq({'a' => 1, 'b' => 2})
  end
end
