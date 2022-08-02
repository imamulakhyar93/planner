# frozen_string_literal: true

class DateTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    attr_before_cast = record.send("#{attr_name}_before_type_cast")
    iso_format = '%Y-%m-%dT%H:%M:%S%z'
    DateTime.strptime(attr_before_cast, iso_format) if value.nil? && attr_before_cast.present?
    attr_comparison = options.fetch(:greater_than, nil)
    # if greater than comparison is exists and attr value is present lets validate it
    if value.present? && attr_comparison.present? && value < record.send(attr_comparison)
      record.errors.add(attr_name, "should greater than #{attr_comparison}")
    end
  rescue Date::Error
    record.errors.add(attr_name, 'not valid format, please use ISO format')
  end
end
