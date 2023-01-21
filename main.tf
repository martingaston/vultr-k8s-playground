data "vultr_os" "ubuntu" {
  filter {
    name   = "name"
    values = ["Ubuntu 22.04 LTS x64"]
  }
}

data "vultr_plan" "plan" {
  filter {
    name   = "id"
    values = ["vc2-1c-1gb"]
  }
}

data "vultr_region" "london" {
  filter {
    name   = "city"
    values = ["London"]
  }
}

resource "vultr_ssh_key" "gh" {
  name    = "gh"
  ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoQKRYoS46x+Ry3t4QgRdKYFjN1TPuVcfH0ybVoNmEuxCpY0/bsHrGB5NLxarVoLIQOjo2zaXZnXODxfbNZvZmNp2bF3OH08wGieek0z3JNsRSO1Zbucdb1QZl+FE5QWSbRqxuyABktY+izubTIoUtg8uOfa1ClwxLx4vRy8qhEtlluieJG8L08DSWlY4KzlGZbFdA+/evqDVJxLXI2uCW7twiRBg3kq/tX5F4Z2FvT8A1fkxLytlorceO6zUV/BuMIdP5Y1AnExssLBweeqJ9me9rGQvqCNRzlEloYTExG701JYVMlOXjEbzeL4520Ca10HNcs2R/EOAZfVzYZNYETVQIYBaOkUcDK/TcH66r153vgtxXKYw/yXdlc/+ba+Y56EtiRzslEhfzlIqCTdQSpQHYpuvpNViU4AFGzLeDX3f+U/kzLUplfWTqecAnlidw2QBV1KWM7GCGksZxlI0l0++7UbAfRjtaBvGaIZxj9n+qcsBywpwimXBuE+52D44/ic1/w94CAd+Lsv2yzY8Wtid1RCbu42zp7eenmc6sxaLvrVaxQPNLABg4ZikVXooHyq++EFUBs8rzm/7Ud1P43oCssPMxrfx9mX2L3gEQuSLRq7/lo/vGStnlvlL6GkVTdbNHPZAxkAyweX95bzKX7WE3en+OBNM5N5BUqo1ClQ== 35241716+martingaston@users.noreply.github.com"
}

resource "vultr_instance" "test" {
  region = data.vultr_region.london.id
  plan   = data.vultr_plan.plan.id
  os_id  = data.vultr_os.ubuntu.id

  ssh_key_ids     = [vultr_ssh_key.gh.id]
  backups         = "disabled"
  enable_ipv6     = false
  ddos_protection = false
}
