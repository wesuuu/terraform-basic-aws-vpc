# Basic AWS VPC

Create an AWS VPC. Defaults to two subnets: 1 public and 1 private in two separate AZs.

*Note: current version is only capable of utilizing internet and NAT gateways. Please submit a pull request if you enable more*

## Configuration

### Adding more resources

To add extra `subnets`/`gateways`/`route_tables`/`nacls`, specify the `extra_{resource}` variable. See example below to add extra gateways

```terraform
module "aws-vpc" {
  source  = "wesuuu/aws-vpc/basic"
  version = "0.1.0"

  extra_gateways = [
      {
          name                  = "My extra internet GW",
          type                  = "internet",
          associate_with_subnet = null
      }
  ]
}
```

`extra_{resource}` resources include: `subnets`, `route_tables`, `route_table_rules`, `nacls`, `nacl_rules`.

### Overriding default resources

To override default behavior, override the variables `subnets`, `route_tables`, `route_table_rules`, `nacls`, `nacl_rules` in the module specification.