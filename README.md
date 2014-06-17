# Invoicer

Invoicer helps you generate invoice documents.

## Getting Started

### Installation

Install WeasyPrint:

    $ virtualenv .venv
    $ source .env
    $ pip install weasyprint

Install required gems:

    $ bundler install

Install default bower components:

    $ bower install

Copy and edit sample configuration files:

    $ cp data/document.yml.sample data/document.yml
    $ cp data/me.yml.sample data/me.yml

### Usage

Start the server:

    $ middleman server

Generate an invoice PDF:

    $ bin/invoicer generate

## Preview

Before generating an invoice PDF, you can have a preview of the document in a web browser.

Open a web browser and go to `http://localhost:4567/`. That's it!

## Data

The `data/` folder is where you define the content of your invoice.
By default, it contains two files that are used by the default view template.

### Me

The `data/me.yml` file contains all the informations relative to your activity such as: logo url, mail, title, website, payment methods and credits.
Attributes are quite explicit.

See `data/me.yml.sample` to have an overview of all possible attributes.

### Document

The `data/document.yml` file contains all the informations relative to a particular invoice such as: date, reference, client informations, available payment methods, products, total amount, global comments and note.
Most of attributes are quite explicit.

There are some special attributes:
* **locale:** Used language (eg. en).
* **template_url:** Used template url (eg. http://localhost:4567/).
* **type:** 'invoice' or 'estimation'.

See `data/document.yml.sample` to have an overview of all possible attributes.

### Add a custom data file

Create a new file in `data` folder, let's name it `terms.yml` and edit it:

    ---
    payment:
      delay_in_days: '10'

If you add in your view the following content:

    span = data.terms.payment.delay_in_days

Finally, the generated view will contain:

    <span>10</span>

## View

Invoicer is shipped with a default view template: `source/index.html.slim`. All its required asset components are defined in `bower.json` configuration file.

You can directly edit and customize this file or create a custom template.

### Create a custom template

Create a new file in `source` folder:

    $ echo "Special invoice" > source/special.html

Then just edit `data/document.yml` file and point `template_url` to your freshly created template:

    ---
    base:
      template_url: 'http://localhost:4567/special.html'

Open a web browser and go to `http://localhost:4567/special.html`.

## I18n

To localize your document, edit `data/document.yml` file and set `locale`:

    ---
    base:
      locale: fr

Then `t` translation helper will automatically use the configured locale.

Locales are defined in `locales/` folder, one file per language.

### Add a translation

If you add in your view the following content:

    p
      = t('document.payment.online.title')

Then, for English language, edit `locales/en.yml`:

    ---
    en:
      document:
        payment:
          online:
            title: 'Online payment'

Finally, the generated view will contain:

    <p>
      Online payment
    <p>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Invoicer is released under the GPL License.
