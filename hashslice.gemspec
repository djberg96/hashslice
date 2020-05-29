require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'hashslice'
  gem.version    = '1.1.2'
  gem.authors    = ['Daniel J. Berger', 'Michael Granger']
  gem.license    = 'Artistic-2.0'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'http://github.com/djberg96/hashslice'
  gem.summary    = "Adds hash slicing to Ruby's Hash class"
  gem.test_file  = 'test/test_hashslice.rb'
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  gem.cert_chain = Dir['certs/*']

  gem.extra_rdoc_files = ['README.rdoc', 'CHANGES.rdoc', 'MANIFEST.rdoc']
   
  gem.add_development_dependency('test-unit', '~> 3')

  gem.description = <<-EOF
    The hashslice library adds builtin hash slicing to Ruby's Hash class.
    This lets you reference, or assign to, multiple hash keys simultaneously
    via the Hash#[] and Hash#[]= methods, respectively.
  EOF
end
