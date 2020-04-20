#Enable TCP port 2375 for external connection to Docker
#https://gist.github.com/styblope/dc55e0ad2a9848f2cc3307d4819d819f

provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}
# Download the latest Ghost image
resource "docker_image" "ghost" {
  name = "ghost:latest"
}

# Start the Container
resource "docker_container" "ghost" {
  name  = "ghost_blog"
  image = "${docker_image.ghost.latest}"
  ports {
    internal = "2368"
    external = "80"
  }
}
