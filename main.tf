

resource "aws_nat_gateway" "natgw" {
  subnet_id = var.public_subnets_ids[0]
  allocation_id = aws_eip.eip.allocation_id

  tags = merge(
    local.common_tags,{
      Name = "${var.env}-NATGW"
    }
  )
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    local.common_tags,{
      Name = "${var.env}-igw"
    }
  )
}