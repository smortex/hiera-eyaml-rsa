# frozen_string_literal: true

require "openssl"
require "hiera/backend/eyaml/encryptor"
require "hiera/backend/eyaml/encrypthelper"
require "hiera/backend/eyaml/logginghelper"
require "hiera/backend/eyaml/options"

class Hiera
  module Backend
    module Eyaml
      module Encryptors
        class Rsa < Encryptor
          self.tag = "RSA"

          self.options = {
            private_key: { desc: "Path to private key",
                           type: :string,
                           default: "./keys/private_key.rsa.pem" },
            public_key: { desc: "Path to public key",
                          type: :string,
                          default: "./keys/public_key.rsa.pem" },
            private_key_env_var: { desc: "Name of environment variable to read private key from",
                                   type: :string },
            public_key_env_var: { desc: "Name of environment variable to read public key from",
                                  type: :string },
            keysize: { desc: "Key size used for encryption",
                       type: :integer,
                       default: 2048 }
          }

          def self.encrypt(plaintext)
            LoggingHelper.trace "RSA encrypt"
            public_key = load_key(:public_key, :public_key_env_var)
            public_key.public_encrypt(plaintext)
          end

          def self.decrypt(ciphertext)
            LoggingHelper.trace "RSA decrypt"
            private_key = load_key(:private_key, :private_key_env_var)
            private_key.private_decrypt(ciphertext)
          end

          def self.create_keys
            public_key = option(:public_key)
            private_key = option(:private_key)
            keysize = option(:keysize)

            key = OpenSSL::PKey::RSA.new(keysize)
            EncryptHelper.ensure_key_dir_exists private_key
            EncryptHelper.write_important_file filename: private_key, content: key.to_pem, mode: 0o600
            EncryptHelper.ensure_key_dir_exists public_key
            EncryptHelper.write_important_file filename: public_key, content: key.public_key.to_pem
            LoggingHelper.info "Keys created OK"
          end

          def self.load_key(key_key, key_env_var_key)
            key = option(key_key)
            key_env_var = option(key_env_var_key)

            raise StandardError, "rsa_#{key_key} is not defined" unless key || key_env_var

            warn "both #{key_key} and #{key_env_var} specified, using #{key_key}" if key && key_env_var

            key_pem = if key_env_var && ENV[key_env_var]
                        ENV[key_env_var]
                      else
                        File.read(key)
                      end
            OpenSSL::PKey::RSA.new(key_pem)
          end
        end
      end
    end
  end
end
