# http_digest_fields

[![Package Version](https://img.shields.io/hexpm/v/http_digest_fields)](https://hex.pm/packages/http_digest_fields)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://http-digest-fields.hexdocs.pm/)

This library currently has support for creating `Content-Digest` and `Repr-Digest` header values with the `sha-512` and `sha-256` algorithms. There is currently no support for `Want-Repr-Digest` and `Want-Content-Digest` header value generation, as these are trivial. However, PRs are welcome.

```sh
gleam add http_digest_fields
```

```gleam
import http_digest_fields/content_digest

pub fn main() -> Nil {
  let value = "This is some content."
  let header_value = content_digest.create_digest_header_value(value, "sha-512")

  case header_value {
    Ok(v) -> io.println("Digest header value: " <> v)
    Error(e) -> io.println("Error creating digest header value: " <> string.inspect(e))
  }
}
```

Further documentation can be found at <https://http-digest-fields.hexdocs.pm/>.

## Development

```sh
gleam run -m example_header
gleam test
```
