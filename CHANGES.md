## 1.2.0 - 23-Sep-2020
* Switched from test-unit to rspec.
* Added a Gemfile.
* Added some metadata to the gemspec.

## 1.1.2 - 14-Jul-2020
* Now silences the redefinition warning.
* Fix the license name in the gemspec (missing hyphen).
* Add an explicit .rdoc extension to the README, MANIFEST and CHANGES files.
* Added a loose dependency (version 3+) to the test-unit development dependency.

## 1.1.1 - 5-Apr-2018
* Fixed deprecation warnings for Ruby 2.4 and later.
* The `VERSION_HASHSLICE` constant is now frozen.
* Updated the cert.

## 1.1.0 - 7-Dec-2015
* This gem is now signed.
* Updates to the gemspec and Rakefile.

## 1.0.9 - 19-Sep-2011
* Cosmetic updates to silence Ruby 1.9.x warnings.

## 1.0.8 - 31-Aug-2011
* Removed an old install task, updated the clean task and set a
  default task in the Rakefile.
* Minor updates to the gemspec.

## 1.0.7 - 27-Sep-2009
* Fixed a packaging bug.
* Minor updates to the gemspec.
* Added the 'gem' Rakefile task.

## 1.0.6 - 26-Aug-2009
* Added the `Hash#slice` alias for `Hash#[]`.
* Added the `Hash#hash_of` method that returns a sub-hash.
* Added test-unit 2.x as a development dependency.

## 1.0.5 - 30-Jul-2009
* Several updates to the gemspec, including a change in the license from
  Artistic to Artistic-2.0.
* Added the install_gem Rake task, and other minor refactorings to the
  Rakefile.
* Minor update to the test suite to make it Ruby 1.9.x compliant. The library
  itself required no changes.

## 1.0.4 - 22-May-2008
* Library now managed by Daniel Berger with the kind permission of
  the original author, Michael Granger.
* Added gemspec, README, MANIFEST, and CHANGES files.
* Added a Rakefile with tasks for testing and installation.
* Replaced the test suite with one based on Test::Unit.

## 1.0.3 - 9-Jun-2004
* Last release by Michael Granger
