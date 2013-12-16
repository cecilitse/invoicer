require 'open3'
require 'shellwords'

module Invoicer
  class Generator
    attr_reader :pdf_path, :template_url, :type

    def initialize(type, template_url, pdf_path)
      @template_url = template_url
      @pdf_path     = pdf_path
      @type         = type
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
  end
end
