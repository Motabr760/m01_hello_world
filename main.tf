terraform { 
    required_providers{
        docker = { 
            source = "kreuzwerker/docker"
            version = "~> 3.0"
        }
    }
}
provider "docker" {}
resource "docker_image" "nginx_hello" {
    name = "nginxdemos/hello"
}
resource "docker_container" "nginx_hello" {
    name = "hello-world-container"
    image = docker_image.nginx_hello.image_id
    ports {
        internal = 80
        external = 8080
    }
}