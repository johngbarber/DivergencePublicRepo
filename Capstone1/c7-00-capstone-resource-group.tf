# Terraform Settings coded in HCL Langague
terraform {
required_version = ">= 1.0.0"
required_providers {
azurerm = {
source = "hashicorp/azurerm"
version = ">= 2.0"
}
}
}
# Configure Microsoft Azure Provider
provider "azurerm"{
features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Define the Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
}

# Define the Web Subnet
resource "azurerm_subnet" "websubnet" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_address
}

# Define the App Subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet_address
}

# Define the DB Subnet
resource "azurerm_subnet" "dbsubnet" {
  name                 = var.db_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet_address
}