locals {
  # Subnets
  public_subnet_ids= [for k, v in lookup(lookup(module.subnets,"public",null ),"subnet_ids",null) : v.id]
  app_subnet_ids= [for k, v in lookup(lookup(module.subnets,"app",null ),"subnet_ids",null) : v.id]
  db_subnet_ids= [for k, v in lookup(lookup(module.subnets,"db",null ),"subnet_ids",null) : v.id]
  private_subnet_ids=  concat(local.app_subnet_ids,local.db_subnet_ids)

  #RT
  public_rt_ids= [for k, v in lookup(lookup(module.subnets,"public",null ),"aws_route_table_ids",null) : v.id]
  app_rt_ids= [for k, v in lookup(lookup(module.subnets,"app",null ),"aws_route_table_ids",null) : v.id]
  db_rt_ids= [for k, v in lookup(lookup(module.subnets,"db",null ),"aws_route_table_ids",null) : v.id]
  private_rt_ids=  concat(local.app_rt_ids,local.db_rt_ids)
}