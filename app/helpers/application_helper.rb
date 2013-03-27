module ApplicationHelper
  def replace_br(text)
    h(text).gsub(/\r?\n/, '<br>').html_safe
  end

  def error_message(model)
    I18n.t('errors.template.header', count: model.errors.size, model: model.class.model_name.human)
  end
end
