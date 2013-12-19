require 'open3'
require 'shellwords'
require 'yaml'

module Invoicer
  class Generator
    attr_reader :pdf_path, :template_url

    def initialize(pdf_path)
      @template_url = build_template_url
      @pdf_path     = pdf_path
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
        self.template_url,
        self.pdf_path
      ]

      Shellwords.join(arguremnts)
    end

    def build_template_url
      document_path = File.join(__dir__, '..', '..', 'data', 'document.yml')
      document      = YAML.load_file(document_path)

      document['base']['template_url']
    end
  end
end
