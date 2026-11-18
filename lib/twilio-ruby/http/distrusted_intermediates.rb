# frozen_string_literal: true

require 'openssl'
require 'set'

module Twilio
  module HTTP
    # Refuses TLS connections whose certificate chain contains one of eight intermediate certificates that are no
    # longer trustworthy.
    #
    # The private keys of these intermediates are weak, so anyone can use them to issue a certificate that a
    # default trust store accepts. This is the same list Go distrusts as of Go 1.27.3 and 1.26.10
    # (CVE-2026-111943, golang/go#82345). Each certificate is identified by the SHA-256 hash of its DER-encoded
    # SubjectPublicKeyInfo.
    #
    # {Twilio::HTTP::Client} applies this check by default when it uses the +:net_http+ Faraday adapter. Other
    # adapters don't expose OpenSSL's verify callback through Faraday, so they don't get the check unless you set
    # it up yourself, for example with Net::HTTP directly:
    #
    #   http.verify_callback = Twilio::HTTP::DistrustedIntermediates.verify_callback
    module DistrustedIntermediates
      # Copied from Go commit 7f86f957633ee31a1c17a1eb8452ca7a3d9bc141 (src/crypto/x509/verify.go).
      DISTRUSTED_SPKI_SHA256 = Set.new(
        [
          'ebed6475c2c2d80fcb199f3fe8dd6e6b3ce60b77eb15d4e42c3dec0c6f5b5105',
          '49dd353dc2b919a3770645117d0e60c16115e7d1bc259eefe734b00ea434fe5f',
          'e0254c7fcdc265e2f0f8a428dabb75ab4ae039b4872d62f5ee57f0877d5a8a41',
          '5c0660a2b164910d8ff589c18e14552e9e0ec237dcefe2cb736d41a4811f81a0',
          '43bffa19d6ef651451f6841e019931e96f6f2eaeff28ab4b6f1ce4576de2717b',
          '63ecefee431d49523bc1136c4e72d0206a477086caf606cd5cf025686c109cf8',
          'ec4ffa1ad0ac88081314b7aaffef6a91f97cd57291bb5ba686c5415f5eb4f6b6',
          '92c063d67e8f14db71d288e11266ffdaf69cbf115f7bab14f3bc2f68d25e0e30'
        ]
      ).freeze

      # X509_V_ERR_CERT_REJECTED
      REJECTED_ERROR = OpenSSL::X509::V_ERR_CERT_REJECTED
      ERROR_MESSAGE = 'Certificate chain which you are using contains a distrusted intermediate certificate'

      module_function

      # Build an OpenSSL verify callback. OpenSSL calls it for every certificate in the chain it builds, so a
      # distrusted intermediate is rejected even when a server sends it as an optional extra certificate.
      def verify_callback(distrusted = DISTRUSTED_SPKI_SHA256)
        lambda do |preverify_ok, store_context|
          if distrusted?(store_context.current_cert, distrusted)
            store_context.error = REJECTED_ERROR
            store_context.error_string = ERROR_MESSAGE if store_context.respond_to?(:error_string=)
            false
          else
            preverify_ok
          end
        end
      end

      def distrusted?(certificate, distrusted = DISTRUSTED_SPKI_SHA256)
        distrusted.include?(spki_sha256_hex(certificate))
      end

      def spki_sha256_hex(certificate)
        OpenSSL::Digest::SHA256.hexdigest(subject_public_key_info(certificate))
      end

      # Go hashes the SubjectPublicKeyInfo bytes as they appear in the certificate, so read them from the
      # TBSCertificate rather than re-encoding the parsed public key.
      #
      # TBSCertificate ::= SEQUENCE { version [0] EXPLICIT OPTIONAL, serialNumber, signature, issuer, validity,
      #                               subject, subjectPublicKeyInfo, ... }
      def subject_public_key_info(certificate)
        tbs = OpenSSL::ASN1.decode(certificate.to_der).value.first.value
        versioned = tbs.first.tag_class == :CONTEXT_SPECIFIC && tbs.first.tag.zero?
        tbs[versioned ? 6 : 5].to_der
      rescue OpenSSL::ASN1::ASN1Error, NoMethodError
        # OpenSSL already parsed this certificate, so this shouldn't happen.
        certificate.public_key.to_der
      end
    end
  end
end
