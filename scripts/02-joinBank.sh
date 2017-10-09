ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/regulatory.com/orderers/orderer.regulatory.com/msp/tlscacerts/tlsca.regulatory.com-cert.pem
CORE_PEER_LOCALMSPID="bank1MSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank1.regulatory.com/peers/peer0.bank1.regulatory.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/bank1.regulatory.com/users/Admin@bank1.regulatory.com/msp
CORE_PEER_ADDRESS=peer0.bank1.regulatory.com:7051
CHANNEL_NAME=fcachannel
CORE_PEER_TLS_ENABLED=true

peer channel join -b $CHANNEL_NAME.block  >&log.txt
cat log.txt
