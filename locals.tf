locals {
  # Subnets
  public_subnet_ids= lookup(lookup(module.subnets,"public",null ),"subnet_ids",null)
  app_subnet_ids= lookup(lookup(module.subnets,"app",null ),"subnet_ids",null)
  db_subnet_ids= lookup(lookup(module.subnets,"db",null ),"subnet_ids",null)
  private_subnet_ids=  concat(local.app_subnet_ids,local.db_subnet_ids)

  #RT
  public_rt_ids= lookup(lookup(module.subnets,"public",null ),"aws_route_table_ids",null)
  app_rt_ids= lookup(lookup(module.subnets,"app",null ),"aws_route_table_ids",null)
  db_rt_ids= lookup(lookup(module.subnets,"db",null ),"aws_route_table_ids",null)
  private_rt_ids=  concat(local.app_rt_ids,local.db_rt_ids)
}