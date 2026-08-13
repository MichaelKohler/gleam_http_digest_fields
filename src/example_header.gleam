import gleam/io
import gleam/string
import http_digest_fields/content_digest

pub fn main() {
  let value = "{hello:\"world\"}"
  let header_value = content_digest.create_digest_header_value(value, "sha-512")

  case header_value {
    Ok(v) -> io.println("Digest header value: " <> v)
    Error(e) ->
      io.println("Error creating digest header value: " <> string.inspect(e))
  }
}
