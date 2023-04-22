terraform {
  required_providers {
    ciscoapphosting = {
      source  = "robertcsapo/ciscoapphosting"
      version = "1.0.0"
    }
    thousandeyes = {
      source  = "thousandeyes/thousandeyes"
      version = "1.0.0-beta"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.8.0"
    }
  }
}

provider "ciscoapphosting" {
  username = var.username
  password = var.password
  insecure = var.insecure
  timeout  = var.timeout
}

provider "thousandeyes" {
  token = "thousandeyes_api_token"
}

locals {
  te_agent_token = "thousandeyes_agent_token"
}

resource "ciscoapphosting_app" "thousandeyes" {
  host                 = var.hosts.0
  name                 = "thousandeyes"
  image                = "https://downloads.thousandeyes.com/enterprise-agent/thousandeyes-enterprise-agent-4.2.2.cisco.tar"
  app_gigabit_ethernet = "1/0/1"
  vlan_trunk           = false
  vlan                 = 1
  env = {
    TEAGENT_ACCOUNT_TOKEN = local.te_agent_token
  }
}

resource "time_sleep" "wait" {
  depends_on      = [ciscoapphosting_app.thousandeyes]
  create_duration = "120s"
}

data "thousandeyes_agent" "catalyst9k" {
  depends_on = [time_sleep.wait]
  agent_name = ciscoapphosting_app.thousandeyes.hostname
}

resource "thousandeyes_http_server" "webex_http_test" {
  provider  = thousandeyes
  test_name = "Terraform - cisco.webex.com"
  interval  = 120
  url       = "https://cisco.webex.com"
  agents {
    agent_id = data.thousandeyes_agent.catalyst9k.agent_id
  }
  alerts_enabled = false
}