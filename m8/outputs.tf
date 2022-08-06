output "space_coyote_ip" {
  value = "http://$${google_compute_instance.vm_instances.network[count.index]_interface.0.access_config.0.nat_ip}"
}