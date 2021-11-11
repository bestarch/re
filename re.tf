
locals {
  location_0        = azurerm_resource_group.abhi-rg.location
  resource_grp_name = azurerm_resource_group.abhi-rg.name
}

## RE Cluster

resource "azurerm_redis_enterprise_cluster" "abhi-re-1" {
  name                = "abhi-re-1"
  resource_group_name = local.resource_grp_name
  location            = local.location_0
  sku_name            = "Enterprise_E20-2"
  zones               = [2]
}

resource "azurerm_redis_enterprise_database" "abhi-db-1" {
  name                = "default"
  resource_group_name = local.resource_grp_name
  cluster_id          = azurerm_redis_enterprise_cluster.abhi-re-1.id
  client_protocol     = "Plaintext"
  clustering_policy   = "EnterpriseCluster"
  # primary_access_key = ""
}


