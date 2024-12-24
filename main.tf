provider "azurerm" {
  features {}

 
  subscription_id = "2b4401a9-a4dc-47ab-a7e4-23c5ba5e542c"
}


resource "azurerm_resource_group" "example" {
  name     = "project1-resources"
  location = "North europe"  
}


resource "azurerm_app_service_plan" "example" {
  name                = "project1-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Free"      
    size = "B1"
  }
}


resource "azurerm_app_service" "example" {
  name                = "project1-appservice"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
