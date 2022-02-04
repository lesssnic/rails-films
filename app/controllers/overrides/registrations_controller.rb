module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
      super
    end
  end
end
