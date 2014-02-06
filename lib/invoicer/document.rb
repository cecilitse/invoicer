module Invoicer
  class Document
    def initialize
      document_path   = File.join(__dir__, '..', '..', 'data', 'document.yml')
      @yaml_document  = YAML.load_file(document_path)
    end

    def client_title
      @yaml_document['client']['title'].downcase.gsub(' ','-')
    end

    def invoice_reference
      @yaml_document['base']['reference']
    end

    def template_url
      @yaml_document['base']['template_url']
    end
  end
end
