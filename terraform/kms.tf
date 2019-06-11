resource "google_kms_key_ring" "my_key_ring" {
  name     = "mysopskeyring"
  project  = "gabriel-garrido"
  location = "global"
}

resource "google_kms_crypto_key" "my_crypto_key" {
  name            = "mysopskey"
  key_ring        = "${google_kms_key_ring.my_key_ring.self_link}"
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = false
  }
}
