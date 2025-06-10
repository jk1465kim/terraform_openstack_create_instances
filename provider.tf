terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
    source = "terraform-provider-openstack/openstack"
    version = "~> 1.48.0"
    }
  }
}

provider "openstack" {
  #user_name   = "admin"
  #tenant_name = "admin"
  #password    = "pwkspjbDAugv5PeqPJ6jD3juNIRsq8jqNiTWmfiN"
  application_credential_id = "10c43753e4d14e87bcd8236c4913fa30"
  application_credential_secret = "xqVBfFx0jkQvdtx54sME1fofkvyTOwTfVGxGVdlB5658coywaQdlUSkXHsDof04_VfDZm17Cj3ExSA54XMI9MA"
  auth_url    = "http://192.168.11.110:5000"
  region      = "RegionOne"
  endpoint_type = "internal"
  
}
