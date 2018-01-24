ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer.myapp.com/msp/tlscacerts/tlsca.myapp.com-cert.pem
CORE_PEER_LOCALMSPID="hboMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hbo.myapp.com/peers/peer0.hbo.myapp.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hbo.myapp.com/users/Admin@hbo.myapp.com/msp
CORE_PEER_ADDRESS=peer0.hbo.myapp.com:7051
CHANNEL_NAME=serieschannel
CORE_PEER_TLS_ENABLED=true

peer channel join -b $CHANNEL_NAME.block  >&log.txt
cat log.txt
