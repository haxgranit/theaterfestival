module Metadata
  extend ActiveSupport::Concern

  def collect_metadata(source)
    @klass = self.class
    source
      .try(:attributes)
      .try(:delete_if) { |_, v| v.blank? }
      .try(:except, 'id', "#{@klass}_id", 'created_at', 'updated_at')
  end


end
