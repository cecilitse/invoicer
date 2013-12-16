# Invoicer

Invoicer helps you generate documents for your activity.

## Installation

Install WeasyPrint:

    $ virtualenv .venv
    $ source .env
    $ pip install weasyprint

Install required gems:

    $ bundler install

Install required bower components:

    $ bower install

## Usage

Start the server:

    $ middleman server

Generate a document:

    $ bin/invoicer generate <type> # type can be `estimation` or `invoice`

## Notes

Invoicer is shipped with a base template. All its required components are specified in bower.json 
configuration file
