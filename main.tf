terraform {
  required_providers {
    time = {
      source = "hashicorp/time"
      version = "~> 0.7"
    }
  }
}

provider "time" {}

resource "time_sleep" "wait_1_minute" {
  create_duration = "1m" // 1 minute sleep time
}

# Example resource to demonstrate the delay
resource "null_resource" "example" {
  depends_on = [time_sleep.wait_1_minute]
  provisioner "local-exec" {
    command = "echo 'This will run after a 1-minute delay.'"
  }
}
