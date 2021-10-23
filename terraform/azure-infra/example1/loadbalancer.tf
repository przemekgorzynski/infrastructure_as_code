resource "azurerm_lb" "prod_lb" {
  name                = var.loadbalancer-name
  location            = azurerm_resource_group.rg_prod.location
  resource_group_name = azurerm_resource_group.rg_prod.name
  
  frontend_ip_configuration {
    name                 = var.pip-loadbalancer-name
    public_ip_address_id = azurerm_public_ip.pip-loadbalancer.id
  }
}

resource "azurerm_lb_backend_address_pool" "loadbalancer_backend_pool" {
  loadbalancer_id = azurerm_lb.prod_lb.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "loadbalancer_backen_pool_nic_assosiation" {
  for_each                = toset(var.vms-prod)
  network_interface_id    = azurerm_network_interface.nic-prod[each.value].id
  ip_configuration_name   = "${each.value}.${var.nic_sufix}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.loadbalancer_backend_pool.id
}

resource "azurerm_lb_probe" "loadbalancet_heaalth_probe" {
  resource_group_name = azurerm_resource_group.rg_prod.name
  loadbalancer_id     = azurerm_lb.prod_lb.id
  name                = "http-running-probe"
  protocol            = "TCP"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 3 
}

resource "azurerm_lb_rule" "loadbalancer_rule" {
  resource_group_name            = azurerm_resource_group.rg_prod.name
  loadbalancer_id                = azurerm_lb.prod_lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  probe_id                       = azurerm_lb_probe.loadbalancet_heaalth_probe.id   
  frontend_ip_configuration_name = azurerm_lb.prod_lb.frontend_ip_configuration[0].name
  backend_address_pool_id        = azurerm_lb_backend_address_pool.loadbalancer_backend_pool.id
}