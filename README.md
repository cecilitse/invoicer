# Invoicer

Invoicer helps you generate invoice documents.

## Usage

Start the server:

    $ middleman server

Generate an invoice PDF:

    $ bin/invoicer generate

## Installation

Install WeasyPrint:

    $ virtualenv .venv
    $ source .env
    $ pip install weasyprint

Install required gems:

    $ bundler install

Install required bower components:

    $ bower install

Copy and edit configuration files:

    $ cp data/document.yml.sample data/document.yml
    $ cp data/me.yml.sample data/me.yml

## Notes

* Invoicer is shipped with a default template (see `source/index.html.slim`).
  All its required components are specified in `bower.json` configuration file.
* In order to localize your document, set your locale by filling `data.document.base.locale` variable.
  It's then automatically used by `t` translation helper.

## Creating templates

You can directly edit `source/index.html.slim` file or create a new one in `source` directory:

    $ echo "Hello world" > source/hello.html

Then just edit `data/document.yml` file:

    ---
    base:
      template_url: 'http://localhost:4567/hello.html'

Open a web browser and go to `http://localhost:4567/hello.html`. That's it!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Invoicer is released under the GPL License.
