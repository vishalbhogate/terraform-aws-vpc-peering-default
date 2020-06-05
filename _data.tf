data aws_vpc requester {
  id = var.vpc_id
}

data aws_vpc accepter {
  provider = aws.peer
  id       = var.peer_vpc_id
}

data aws_subnet_ids requester {
  vpc_id = var.vpc_id

  filter {
    name   = "tag:Scheme"
    values = ["transit"]
  }
}

data aws_subnet requester {
  count = length(data.aws_subnet_ids.requester.ids)
  id    = tolist(data.aws_subnet_ids.requester.ids)[count.index]
}


data aws_subnet_ids accepter_public {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id


  filter {
    name   = "tag:Scheme"
    values = ["public"]
  }
}

data aws_subnet_ids accepter_private {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id

  filter {
    name   = "tag:Scheme"
    values = ["private"]
  }
}

data aws_subnet_ids accepter_secure {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id

  filter {
    name   = "tag:Scheme"
    values = ["secure"]
  }
}

data aws_route_table requester {
  count     = length(data.aws_subnet_ids.requester.ids)
  subnet_id = tolist(data.aws_subnet_ids.requester.ids)[count.index]
}

data aws_route_table accepter_public {
  provider  = aws.peer
  count     = length(data.aws_subnet_ids.accepter_public.ids)
  subnet_id = tolist(data.aws_subnet_ids.accepter_public.ids)[count.index]
}

data aws_route_table accepter_private {
  provider  = aws.peer
  count     = length(data.aws_subnet_ids.accepter_private.ids)
  subnet_id = tolist(data.aws_subnet_ids.accepter_private.ids)[count.index]
}

data aws_route_table accepter_secure {
  provider  = aws.peer
  count     = length(data.aws_subnet_ids.accepter_secure.ids)
  subnet_id = tolist(data.aws_subnet_ids.accepter_secure.ids)[count.index]
}

data aws_network_acls requester {
  vpc_id = var.vpc_id

  tags = {
    Scheme = "transit"
  }
}

data aws_network_acls accepter_public {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id

  tags = {
    Scheme = "public"
  }
}

data aws_network_acls accepter_private {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id

  tags = {
    Scheme = "private"
  }
}


data "aws_network_acls" "accepter_secure" {
  provider = aws.peer
  vpc_id   = var.peer_vpc_id

  tags = {
    Scheme = "secure"
  }
}
