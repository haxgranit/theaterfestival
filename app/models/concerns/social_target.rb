module SocialTarget
  extend ActiveSupport::Concern

  included do
    acts_as_followable
    acts_as_likeable
    acts_as_mentionable
  end

end
