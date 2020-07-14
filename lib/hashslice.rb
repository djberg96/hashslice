class Hash
  alias href []
  alias hset []=

  # The version of the hashslice library
  VERSION_HASHSLICE = '1.1.2'.freeze

  # Retrieve a hash slice. If a single key is provided, returns a single
  # value. If multiple keys are provided, an array of values is returned.
  #
  # Examples:
  #
  #     hash = {'a' => 1, 'b' => 2, 'c' => 3}
  #     hash['a']       -> 1
  #     hash['a', 'c']  -> [1, 3]
  #
  def [](*args)
    if args.length == 1
      href(args[0])
    else
      args.map{ |k| href(k) }
    end
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
  # Examples:
  #
  #     hash['a'] = 1, 2          -> {a => [1, 2]}
  #     hash['a', 'b'] = 3, 4     -> {a => 3, b => 4}
  #     hash['a', 'b'] = 5        -> {a => 5, b => nil}
  #     hash['a', 'b'] = 3, 4, 5  -> {a => 3, b => 4}
  #
  def []=(*args)
    if args.length <= 2
      hset(*args)
    else
      values = args.pop # Last arg is the value. The rest are keys.
      values = [values] unless values.is_a?(Array)
      args.each_index{ |i| hset(args[i], values[i]) }
    end
  end

  # Returns a sub-hash of the current hash.
  #
  # Example:
  #
  #    hash = {'a' => 1, 'b' => 2, 'c' => 3}
  #    hash.hash_of('a', 'b') -> {'a' => 1, 'b' => 2}
  #
  def hash_of(*args)
    temp = {}
    args.map{ |k| temp[k] = href(k) }
    temp
  end
end
