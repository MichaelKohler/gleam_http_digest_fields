/// Errors that can occur while creating a digest header value.
pub type DigestError {
  /// Unsupported algorithm is provided
  AlgorithmError(String)
}
