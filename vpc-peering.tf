resource aws_vpc_peering_connection requester {
  vpc_id        = var.vpc_id
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.peer_vpc_id
  peer_region   = var.accepter_region
}


resource aws_vpc_peering_connection_accepter accepter {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
  auto_accept               = true
}
