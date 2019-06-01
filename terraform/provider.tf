provider "google" {
  credentials = "${file("account.json")}"
  project     = "gabriel-garrido"
  region      = "us-central1"
}
