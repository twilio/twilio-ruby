# frozen_string_literal: true

require 'openssl'

module Twilio
  module HTTP
    ##
    # Refuses TLS connections whose certificate chain contains one of eight intermediate certificates that are no
    # longer trustworthy: their private keys are weak, so anyone can use them to issue a certificate that a default
    # trust store accepts. This is the same list Go distrusts as of Go 1.27.3 and 1.26.10 (CVE-2026-111943,
    # golang/go#82345). Each certificate is identified by the SHA-256 hash of its DER-encoded SubjectPublicKeyInfo.
    #
    # Twilio::HTTP::Client applies this check when it uses Faraday's default :net_http adapter. A custom HTTP client
    # that uses Net::HTTP can opt in with:
    #
    #   f.adapter(:net_http) { |http| Twilio::HTTP::DistrustedIntermediates.apply(http) }
    module DistrustedIntermediates
      # Copied from Go commit 7f86f957633ee31a1c17a1eb8452ca7a3d9bc141 (src/crypto/x509/verify.go).
      SPKI_SHA256 = [
        'ebed6475c2c2d80fcb199f3fe8dd6e6b3ce60b77eb15d4e42c3dec0c6f5b5105',
        '49dd353dc2b919a3770645117d0e60c16115e7d1bc259eefe734b00ea434fe5f',
        'e0254c7fcdc265e2f0f8a428dabb75ab4ae039b4872d62f5ee57f0877d5a8a41',
        '5c0660a2b164910d8ff589c18e14552e9e0ec237dcefe2cb736d41a4811f81a0',
        '43bffa19d6ef651451f6841e019931e96f6f2eaeff28ab4b6f1ce4576de2717b',
        '63ecefee431d49523bc1136c4e72d0206a477086caf606cd5cf025686c109cf8',
        'ec4ffa1ad0ac88081314b7aaffef6a91f97cd57291bb5ba686c5415f5eb4f6b6',
        '92c063d67e8f14db71d288e11266ffdaf69cbf115f7bab14f3bc2f68d25e0e30'
      ].freeze
      private_constant :SPKI_SHA256

      ##
      # Adds the distrust check to a Net::HTTP connection. It runs after OpenSSL's own chain verification and only
      # ever turns a successful verification into a failure; Net::HTTP still checks the hostname.
      def self.apply(http)
        http.verify_callback = verify_callback(SPKI_SHA256)
        http
      end

      def self.verify_callback(distrusted)
        lambda do |preverify_ok, store_context|
          return preverify_ok unless preverify_ok && distrusted?(store_context.chain, distrusted)

          store_context.error = OpenSSL::X509::V_ERR_CERT_REJECTED
          false
        end
      end

      # Checks the chain OpenSSL built, like Go.
      def self.distrusted?(chain, distrusted)
        Array(chain).any? { |cert| distrusted.include?(spki_sha256(cert)) }
      end

      # Certificate ::= SEQUENCE { tbsCertificate, signatureAlgorithm, signatureValue }
      # TBSCertificate ::= SEQUENCE { version [0] EXPLICIT OPTIONAL, serialNumber, signature, issuer, validity,
      #                               subject, subjectPublicKeyInfo, ... }
      # Go hashes the SubjectPublicKeyInfo as it appears in the certificate, so read it from the DER rather than
      # re-encoding the public key.
      def self.spki_sha256(cert)
        fields = OpenSSL::ASN1.decode(cert.to_der).value[0].value
        fields = fields.drop(1) if fields[0].tag_class == :CONTEXT_SPECIFIC
        OpenSSL::Digest::SHA256.hexdigest(fields[5].to_der)
      end

      private_class_method :verify_callback, :distrusted?, :spki_sha256
    end
  end
end
