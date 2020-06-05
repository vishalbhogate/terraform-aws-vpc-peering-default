resource aws_route accepter_public {
  provider = aws.peer
  count    = length(distinct(data.aws_route_table.accepter_public.*.route_table_id))
  route_table_id = element(
    distinct(data.aws_route_table.accepter_public.*.route_table_id),
    count.index
  )
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id

}

resource aws_route accepter_private {
  provider = aws.peer
  count    = length(distinct(data.aws_route_table.accepter_private.*.route_table_id))
  route_table_id = element(
    distinct(data.aws_route_table.accepter_private.*.route_table_id),
    count.index
  )
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}


resource aws_route accepter_secure {
  provider = aws.peer
  count    = length(distinct(data.aws_route_table.accepter_secure.*.route_table_id))
  route_table_id = element(
    distinct(data.aws_route_table.accepter_secure.*.route_table_id),
    count.index
  )
  destination_cidr_block    = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}

resource aws_route requester {
  count = length(distinct(data.aws_route_table.requester.*.route_table_id))
  route_table_id = element(
    distinct(data.aws_route_table.requester.*.route_table_id),
    count.index
  )
  destination_cidr_block    = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
}

