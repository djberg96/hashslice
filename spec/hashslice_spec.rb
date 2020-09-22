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

  example "version" do
    expect(Hash::VERSION_HASHSLICE).to eq('1.2.0')
    expect(Hash::VERSION_HASHSLICE).to be_frozen
  end

=begin
  example "get_slice_instance_method_basic" do
    expect(@hash).to respond_to(:[])
    expect{ @hash['a'] }.not_to raise_error
    expect{ @hash['a', 'b'] }.not_to raise_error
    expect( @hash['a']).to be_kind_of(Integer)
    expect( 'b']).to be_kind_of(Array, @hash['a')
  end

  example "get_slice_instance_method" do
    expect( @hash['a']).to eq(1)
    expect( 'b']).to eq([1, 2], @hash['a')
    expect( 'c']).to eq([1, 2, nil], @hash['a', 'b')
    expect(@hash['bogus']).to be_nil
  end

  example "get_slice_duplicate_keys" do
    expect( 'a']).to eq([1, 1], @hash['a')
    expect( 'b']).to eq([1, 2, 1, 2], @hash['a', 'b', 'a')
  end

  example "set_slice_instance_method_basic" do
    expect(@hash).to respond_to(:[]=)
    expect{ @hash['a'] = 3 }.not_to raise_error
    expect{ @hash['a', 'b'] = 3 }.not_to raise_error
    expect{ @hash['a', 'b'] = 3, 4 }.not_to raise_error
    expect( @hash['a'] = 3).to be_kind_of(Integer)
    expect( 'b'] = 3).to be_kind_of(Integer, @hash['a')
    expect( 4).to be_kind_of(Integer, @hash['a', 'b'] = 3)
  end

  # hash[key] = value
  example "set_slice_instance_method_single_key_and_value" do
    expect{ @hash['a'] = 3 }.not_to raise_error
    expect{ @hash['b'] = [1, 2] }.not_to raise_error
    expect( @hash).to eq({'a' => 3, 'b' => [1, 2]})
  end

  # hash[key1, key2] = value
  example "set_slice_instance_method_multiple_keys_single_value" do
    expect{ @hash['a', 'b'] = 3 }.not_to raise_error
    expect( @hash).to eq({'a' => 3, 'b' => nil})
  end

  # hash[key1, key2] = value1, value2
  example "set_slice_instance_method_multiple_keys_multiple_values" do
    expect{ @hash['a', 'b'] = 3, 4 }.not_to raise_error
    expect( @hash).to eq({'a' => 3, 'b' => 4})
  end

  # hash[key] = value1, value2
  example "set_slice_instance_method_single_key_multiple_values" do
    expect{ @hash['a'] = 3, 4 }.not_to raise_error
    expect( @hash).to eq({'a' => [3, 4], 'b' => 2})
  end

  # hash[key1, key2] = value1, value2, value3
  example "set_slice_instance_method_multiple_keys_odd_values" do
    expect{ @hash['a', 'b'] = 3, 4, 5 }.not_to raise_error
    expect( @hash).to eq({'a' => 3, 'b' => 4})
  end

  example "slice_alias" do
    expect(Hash.instance_method(:slice) == Hash.instance_method(:[])).to be true
  end

  example "hash_of" do
    expect(@hash).to respond_to(:hash_of)
    expect( 'b')).to eq({'a' => 1, 'b' => 2}, @hash.hash_of('a')
  end
=end
end
