module ApplicationHelper
  def active_record_errors(record, attribute)
    content_tag :span, record.errors[attribute.to_sym].join(', '), class: 'text-danger'
  end
end
