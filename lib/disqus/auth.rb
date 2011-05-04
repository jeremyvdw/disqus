require 'digest/sha1'

module Disqus
  class Auth
    class << self
      def signature(secret, message, timestamp)
        Digest::SHA1.hexdigest secret, "#{message} #{timestamp}"
      end
    end
  end
end