# Itis - Ruby API for Telefonski Imenik Slovenije

This API uses search suggestion/opensearch and XML to do lookups.
GEM also installs simple command line tool.

## Installation

Add this line to your application's Gemfile:

    gem 'itis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itis

## Usade in the code

    results = Itis.search("Oto Brglez")

    phones = Itis.search("Oto Brglez").first.phones

## Comand line usage

	itis "Oto Brglez"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
