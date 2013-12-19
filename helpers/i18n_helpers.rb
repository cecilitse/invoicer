module I18nHelpers
  def t(key, options={})
    options = { locale: data.document.base.locale }.merge(options)
    I18n.t(key, options)
  end
end
