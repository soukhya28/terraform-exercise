resource "azurerm_resource_group" "exerciseterra" {
    name     = "terraexercise-resources"
    location = "East US"
}
 
resource "azurerm_storage_account" "nevuriterra" {
    name                     = "terrastoragesounevuri2806"
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
