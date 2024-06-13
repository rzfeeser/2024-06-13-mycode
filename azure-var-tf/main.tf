# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc
}

# this is now an "input" value 
variable "loc" {
  type = string
  default = "westus2"
}


# this is now an "input" value
variable "rg_name" {
  type = string
  default = "myTFResourceGroup"
}

# this is now an "input" value
variable "vn_name" {
  type = string
  default = "myTFResourceGroup"
}

variable "str_list" {
   type = list(string)
   default = ["10.0.0.0/16"]
}



resource "azurerm_virtual_network" "example" {
  name                = var.vn_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.str_list
}
