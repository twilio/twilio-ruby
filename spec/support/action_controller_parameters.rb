# A fake version of `ActionController::Parameters` for testing with.
#
# Since Rails 5, `ActionController::Parameters` doesn't inherit from `Hash` so
# hash methods, like `sort` which is used in `Twilio::Util::RequestValidator`
# are being deprecated. See the discussion here:
# https://github.com/rails/rails/issues/23084.
module ActionController
  class Parameters < Hash
    def to_unsafe_h
      # Creates a new Hash using the values of this hash. We could use `to_h`
      # Once Ruby 1.9.3 is dropped from CI.
      Hash[self]
    end

    def sort
      raise "Can't sort directly on ActionController::Parameters"
    end
  end
end
