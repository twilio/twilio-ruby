module Twilio
  module REST
    class PreviewIam < PreviewIamBase
      def account
        self.organizations.accounts
      end
      def role_assignment
        self.organizations.role_assignments
      end
      def user
        self.organizations.users
      end
    end
  end
end
