ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/myapp.com/orderers/orderer.myapp.com/msp/tlscacerts/tlsca.myapp.com-cert.pem
CORE_PEER_LOCALMSPID="netflixMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/netflix.myapp.com/peers/peer0.netflix.myapp.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/netflix.myapp.com/users/Admin@netflix.myapp.com/msp
CORE_PEER_ADDRESS=peer0.netflix.myapp.com:7051
CHANNEL_NAME=serieschannel
CORE_PEER_TLS_ENABLED=true

peer chaincode install -n mycontract -v 1.0 -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 >&log.txt
cat log.txt
