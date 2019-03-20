provider "helm" {
    kubernetes {
        config_path = "${file("/home/lars/src/infra/.secrets/k8s_cluster_config/config.yaml")}"
    }
}
resource "helm_repository" "${var.helm_repository_name}" {
    name = "${var.helm_repository_name}"
    url  = "${var.helm_repository_url}"
}
resource "helm_release" "${var.helm_release_name}" {
    name        = "${var.helm_release_name}"
    namespace   = "${var.helm_release_namespace}"
    repository  = "${"helm_repository.${var.helm_repository_name}.metadata.0.name"}"
    chart       = "${var.helm_release_chart}"
    version     = "${var.helm_release_version}"

    set {
        name    = "${var.helm_release_set}"
        value   = "${var.helm_app_value}"
    }
}