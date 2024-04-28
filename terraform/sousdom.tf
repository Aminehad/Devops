resource "ovh_domain_zone_record" "cloud" {
  # Définition des attributs requis
  zone       = "uca-devops.ovh"
  fieldtype  = "A"
  subdomain  = "cloud.amhadid"
  ttl        = 3600
  target     = "185.34.141.214"
}

resource "ovh_domain_zone_record" "blog" {
  # Définition des attributs requis
  zone       = "uca-devops.ovh"
  fieldtype  = "A"
  subdomain  = "blog.amhadid"
  ttl        = 3600
  target     = "185.34.141.214"
}

resource "ovh_domain_zone_record" "projet" {
  # Définition des attributs requis
  zone       = "uca-devops.ovh"
  fieldtype  = "A"
  subdomain  = "project.amhadid"
  ttl        = 3600
  target     = "185.34.141.214"
}
