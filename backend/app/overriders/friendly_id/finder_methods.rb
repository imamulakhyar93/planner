# frozen_string_literal: true

# Override the error message when friendly_id resource not found
FriendlyId::FinderMethods.module_eval do
  def raise_not_found_exception(id)
    message = "can't find record with parameter: '#{id}'"
    raise ActiveRecord::RecordNotFound, message if ActiveRecord.version < Gem::Version.create('5.0')

    raise ActiveRecord::RecordNotFound.new(message, name, friendly_id_config.query_field, id)
  end
end
