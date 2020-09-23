require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'hashslice'
  spec.version    = '1.2.0'
  spec.authors    = ['Daniel J. Berger', 'Michael Granger']
  spec.license    = 'Artistic-2.0'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'http://github.com/djberg96/hashslice'
  spec.summary    = "Adds hash slicing to Ruby's Hash class"
  spec.test_file  = 'spec/hashslice_spec.rb'
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = Dir['certs/*']

  spec.extra_rdoc_files = ['README.rdoc', 'CHANGES.rdoc', 'MANIFEST.rdoc']
   
  spec.add_development_dependency('rspec', '~> 3.9')

  spec.metadata = {
    'homepage_uri'      => 'https://github.com/djberg96/hashslice',
    'bug_tracker_uri'   => 'https://github.com/djberg96/hashslice/issues',
    'changelog_uri'     => 'https://github.com/djberg96/hashslice/blob/master/CHANGES',
    'documentation_uri' => 'https://github.com/djberg96/hashslice/wiki',
    'source_code_uri'   => 'https://github.com/djberg96/hashslice',
    'wiki_uri'          => 'https://github.com/djberg96/hashslice/wiki'
  }

  spec.description = <<-EOF
    The hashslice library adds builtin hash slicing to Ruby's Hash class.
    This lets you reference, or assign to, multiple hash keys simultaneously
    via the Hash#[] and Hash#[]= methods, respectively.
  EOF
end
