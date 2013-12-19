# Invoicer

Invoicer helps you generate invoice documents.

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

## Usage

Start the server:

    $ middleman server

Generate an invoice PDF:

    $ bin/invoicer generate

## Notes

* Invoicer is shipped with a default template (see `source/index.html.slim`).
  All its required components are specified in `bower.json` configuration file.
* In order to localize your document, set your locale by filling `data.document.base.locale` variable.
  It's then automatically used by `t` translation helper.

