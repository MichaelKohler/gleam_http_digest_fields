import gleeunit
import http_digest_fields/content_digest

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn content_header_sha256_hello_world_test() {
  let value = "{hello:\"world\"}"
  let header_value = content_digest.create_digest_header_value(value, "sha-256")

  assert header_value
    == Ok("sha-256=:LsWDvMD3TQ5hD1FciIKL6ePw7YR8BVI5dD6NnJwusRs=:")
}

pub fn content_header_sha512_hello_world_test() {
  let value = "{hello:\"world\"}"
  let header_value = content_digest.create_digest_header_value(value, "sha-512")

  assert header_value
    == Ok(
      "sha-512=:YwRB5Y5G6jIfS1V0gBi59+hVKgu+vFjZKmeXdqMQQjwrwh5hA0vNbwDQi30SCiOK+e2dRs3P4tMo72WT3BfmQg==:",
    )
}

pub fn content_header_sha256_empty_string_test() {
  let value = ""
  let header_value = content_digest.create_digest_header_value(value, "sha-256")

  assert header_value
    == Ok("sha-256=:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=:")
}

pub fn content_header_sha512_empty_string_test() {
  let value = ""
  let header_value = content_digest.create_digest_header_value(value, "sha-512")

  assert header_value
    == Ok(
      "sha-512=:z4PhNX7vuL3xVChQ1m2AB9Yg5AULVxXcg/SpIdNs6c5H0NE8XYXysP+DGNKHfuwvY7kxvUdBeoGlODJ6+SfaPg==:",
    )
}
