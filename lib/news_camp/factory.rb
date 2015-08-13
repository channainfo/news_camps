module NewsCamp::Factory
  extend ActiveSupport::Concern

  included do
    # before_create :generate_token_id
  end

  module ClassMethods
    def instance
      @@instance ||= self.new
    end
  end
  
end