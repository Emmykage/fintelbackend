class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, 'secret')

    end

    def decode_token
        auth_header = request.headers['Authorization']

        if auth_header
            token = auth_header.split(" ")[1]

            begin
              JWT.decode(token, 'secret', true, algorithm: 'HS256')

            rescue JWT::DecodeError
                nil
            end
        end

    end

    def authorized_user
        decode_token = decode_token()

       if decode_token
                user_id = decode_token = decode_token[0]['user_id']
                @current_user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: "You have to log in"}, status: :unauthorized unless
        authorized_user

    end

    def initialize_wallet



        @wallet ||= Wallet.find_by(user_id: @current_user.id)


        return unless @wallet.nil?

        @wallet = @current_user.create_wallet

        initialize_earning

    end

    def initialize_earning

        @earning ||= Earning.find_by(wallet_id: @wallet.id)
        return unless @earning.nil?
        @earning = @wallet.create_earning

    end

    def initialize_pocket
        @pocket ||= Pocket.find_by(user_id: @current_user)
        return unless @pocket.nil?
        @pocket = @current_user.create_pocket

    end

    def intialize_statistics
        @statistic ||= Statistic.all.any?

        return if @statistic
        Statistic.create

    end
end
