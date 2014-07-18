require 'open3'
require 'shellwords'

module Invoicer
  class Generator
    attr_reader :document, :pdf_directory

    def initialize(pdf_directory)
      @document       = Invoicer::Document.new
      @pdf_directory  = pdf_directory
    end

    def process
      command         = build_command
      _output, status = Open3.capture2(command)

      status.success?
    end

  private

    def build_command
      executable = 'weasyprint'
      arguremnts = [
        executable,
        '-e',
        'utf8',
        '-m',
        'screen',
        self.document.template_url,
        pdf_path
      ]

      return Shellwords.join(arguremnts)
    end

    def pdf_path
      filename = "#{self.document.invoice_reference}-#{self.document.client_title}.pdf"
      return File.join(self.pdf_directory, filename)
    end
  end
end
