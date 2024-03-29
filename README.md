[![Ruby](https://github.com/djberg96/hashslice/actions/workflows/ruby.yml/badge.svg)](https://github.com/djberg96/hashslice/actions/workflows/ruby.yml)

## Description
Slicing for Ruby hashes.

## Installation
`gem install hashslice`

## Adding the trusted cert
`gem cert --add <(curl -Ls https://raw.githubusercontent.com/djberg96/hashslice/main/certs/djberg96_pub.pem)`

## Synopsis
```ruby
require 'hashslice'

hash = {'a' => 1, 'b' => 2, 'c' => 3}

# Slice reference
hash['a', 'b'] # -> [1, 2]
hash['a']      # -> 1

# Slice assignment
hash['a', 'b'] = 7, 8

hash # -> {'a' => 7, 'b' => 8, 'c' => 3}

# Sub hash
hash.hash_of('a', 'b') # -> {'a' => 1, 'b' => 2}
```

## Overview
This library modifies the Hash#[] and Hash#[]= methods so that they can
handle list reference or assignment. It also adds the Hash#hash_of method
that returns a hash slice.

### `Hash#[*keys]`
If more than one key is provided then an array is returned. Single
keys work as before, i.e. they return a single value.

### `Hash#[*keys]=(*values)`
The values on the right are assigned to the keys on left on a one for one
If there are more values than keys, the extra values are dropped.

## Copyright
Copyright (c) 2001-2023, The FaerieMUD Consortium and Daniel J. Berger.
All rights reserved.

## License
This module is free software. You may use, modify, and/or redistribute this
software under the terms of the Artistic License 2.0

http://www.perlfoundation.org/artistic_license_2_0

## Authors
* Michael Granger (original author)
* Daniel Berger (current maintainer)
