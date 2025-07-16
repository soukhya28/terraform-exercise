resource "azurerm_resource_group" "exerciseterra" {
    name     = "terraexercise-resources"
    location = "East US"
}
 
resource "azurerm_storage_account" "nevuriterra" {
    name                     = "terrastoragenevu2806"
    resource_group_name      = azurerm_resource_group.exerciseterra.name
    location                 = azurerm_resource_group.exerciseterra.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}
 
resource "azurerm_storage_container" "nevuricontainer" {
    name                  = "terranevuri-container"
    storage_account_name  = azurerm_storage_account.nevuriterra.name
    container_access_type = "private"
}
resource "azurerm_virtual_network" "exerciseterra_vnet" {
    name                = "exerciseterra-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.exerciseterra.location
    resource_group_name = azurerm_resource_group.exerciseterra.name
}
 
resource "azurerm_subnet" "subnet1" {
    name                 = "exercisesubnet1"
    resource_group_name  = azurerm_resource_group.exerciseterraa.name
    virtual_network_name = azurerm_virtual_network.exerciseterra_vnet.name
    address_prefixes     = ["10.0.1.0/24"]
}
 
resource "azurerm_subnet" "subnet2" {
    name                 = "exercisesubnet2"
    resource_group_name  = azurerm_resource_group.exerciseterra.name
    virtual_network_name = azurerm_virtual_network.exerciseterra_vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

 