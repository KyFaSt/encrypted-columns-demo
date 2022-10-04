# frozen_string_literal: true

module Encryption
  class MyAttributeEncryptor < ActiveRecord::Encryption::Encryptor
      def encrypt(clear_text, key_provider: default_key_provider, cipher_options: {})1
        # NEVER DO THIS -- THIS IS FOR DEMONSTRATION PURPOSES ONLY
        Rails.logger.info "encrypting #{clear_text}"
        super(clear_text, key_provider: key_provider, cipher_options: cipher_options)
      end

      def decrypt(previous_data, key_provider: default_key_provider, cipher_options: {})
        # NEVER DO THIS -- THIS IS FOR DEMONSTRATION PURPOSES ONLY
        Rails.logger.info "decrypting #{previous_data}"
        super(previous_data, key_provider: key_provider, cipher_options: cipher_options)
      end
  end
end