module Permissible
  extend ActiveSupport::Concern

  included do
    has_many :permissions, as: :resource, dependent: :destroy
  end

end
