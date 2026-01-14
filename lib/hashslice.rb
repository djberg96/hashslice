# frozen_string_literal: true

# Reopen the core Hash class and redefine the [] and []= methods.
class Hash
  alias href []
  alias hset []=

  # The version of the hashslice library
  VERSION_HASHSLICE = '1.2.0'

  # Retrieve a hash slice. If a single key is provided, returns a single
  # value. If multiple keys are provided, an array of values is returned.
  #
  # @param args [Array] The keys to retrieve values for
  # @return [Object, Array] Single value for one key, array of values for multiple keys
  #
  # Examples:
  #
  #     hash = {'a' => 1, 'b' => 2, 'c' => 3}
  #     hash['a']       -> 1
  #     hash['a', 'c']  -> [1, 3]
  #
  def [](*keys)
    return href(keys.first) if keys.length == 1

    keys.map { |key| href(key) }
  end

  # Temporarily silence redefinition warning.
  begin
    old_verbose = $VERBOSE
    $VERBOSE = false
    alias slice []
  ensure
    $VERBOSE = old_verbose
  end

  # Hash slice assignment. You can assign a list of values to a list of keys
  # in a single operation on a one for one basis.
  #
  # If the number of keys exceeds the number of values, the remaining keys
  # are assigned a value of nil.
  #
  # If the number of values exceeds the number of keys, the extra values are
  # dropped.
  #
  # @param args [Array] Keys followed by values (last argument contains the values)
  # @return [Object, Array] The assigned value(s)
  #
  # Examples:
  #
  #     hash['a'] = 1, 2          -> {a => [1, 2]}
  #     hash['a', 'b'] = 3, 4     -> {a => 3, b => 4}
  #     hash['a', 'b'] = 5        -> {a => 5, b => nil}
  #     hash['a', 'b'] = 3, 4, 5  -> {a => 3, b => 4}
  #
  def []=(*args)
    return hset(*args) if args.length <= 2

    *keys, values = args
    values = Array(values) unless values.is_a?(Array)

    keys.each_with_index { |key, index| hset(key, values[index]) }

    values
  end

  # Returns a sub-hash of the current hash.
  #
  # @param keys [Array] The keys to include in the sub-hash
  # @return [Hash] A new hash containing only the specified keys and their values
  #
  # Example:
  #
  #    hash = {'a' => 1, 'b' => 2, 'c' => 3}
  #    hash.hash_of('a', 'b') -> {'a' => 1, 'b' => 2}
  #
  def hash_of(*keys)
    keys.each_with_object({}) { |key, result| result[key] = href(key) }
  end
end
