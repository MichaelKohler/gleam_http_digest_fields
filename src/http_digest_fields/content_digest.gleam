import gleam/bit_array
import gleam/crypto
import gleam/result
import http_digest_fields/errors.{type DigestError, AlgorithmError}
import structured_fields/serializer
import structured_fields/types.{ByteSequence, Item}

/// Creates a Content-Digest header value for the given value and algorithm.
///
/// The value is expected to be a string representation of the content, and
/// the algorithm should be a supported hash algorithm (e.g., "sha-256", "sha-512").
pub fn create_digest_header_value(
  value: String,
  algorithm: String,
) -> Result(String, DigestError) {
  let bit_value = bit_array.from_string(value)

  use digest <- result.try(create_digest(bit_value, algorithm))

  let content_item = Item(ByteSequence(digest), [])
  let header_value =
    serializer.serialize_dictionary([#(algorithm, content_item)])
  Ok(header_value)
}

fn create_digest(
  bit_value: BitArray,
  algorithm: String,
) -> Result(BitArray, DigestError) {
  case algorithm {
    "sha-256" -> Ok(crypto.hash(crypto.Sha256, bit_value))
    "sha-512" -> Ok(crypto.hash(crypto.Sha512, bit_value))
    _ -> Error(AlgorithmError("Unsupported algorithm: " <> algorithm))
  }
}
