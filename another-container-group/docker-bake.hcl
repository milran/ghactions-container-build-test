
// This is what is baked by GitHub Actions
group "default" { targets = ["linux", "nanoserver"] }

// Targets filled by GitHub Actions: one for the regular tag, one for the debug tag
target "docker-metadata-action-linux" {}
target "docker-metadata-action-nanoserver" {}

// This sets the platforms and is further extended by GitHub Actions to set the
// output and the cache locations
target "base" {
  context = "./"
  dockerfile = "Dockerfile"
}

target "linux" {
  inherits = ["base", "docker-metadata-action-linux"]
  target = "linux"
  args = { VARIANT = "linux" }
}

target "nanoserver" {
  inherits = ["base", "docker-metadata-action-nanoserver"]
  target = "nanoserver"
  args = { VARIANT = "nanoserver" }
}