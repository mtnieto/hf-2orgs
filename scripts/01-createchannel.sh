ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/regulatory.com/orderers/orderer.regulatory.com/msp/tlscacerts/tlsca.regulatory.com-cert.pem
CORE_PEER_LOCALMSPID="fcaMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/fca.regulatory.com/peers/peer0.fca.regulatory.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/fca.regulatory.com/users/Admin@fca.regulatory.com/msp
CORE_PEER_ADDRESS=peer0.fca.regulatory.com:7051
CHANNEL_NAME=fcachannel
CORE_PEER_TLS_ENABLED=true

peer channel create -o orderer.regulatory.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/fcachannel.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA >&log.txt
cat log.txt
