module Devise
  module Strategies
    class JsonWebToken < Base

      def store?
        false
      end

      def authenticate!
        return if no_claims || no_claimed_sub || not_logged_in
        user = mapping.to.find_by_id claims['sub']
        return unless user
        success! user
      end

      protected

      def not_logged_in
        !JwtCache.find_by_token(token)
      end

      def bearer_header
        request.headers['Authorization']&.to_s
      end

      def no_claims
        !claims
      end

      def no_claimed_sub
        !claims.has_key?('sub')
      end

      def token
        return nil if bearer_header.nil?
        strategy, jwt_token = bearer_header.split(' ')
        return nil if (strategy || '').downcase != 'bearer'
        jwt_token
      end

      def claims
        JwtWrapper.decode(token) rescue nil
      end
    end
  end
end
