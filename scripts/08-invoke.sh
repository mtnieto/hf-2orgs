ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/regulatory.com/orderers/orderer.regulatory.com/msp/tlscacerts/tlsca.regulatory.com-cert.pem
CORE_PEER_LOCALMSPID="fcaMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/fca.regulatory.com/peers/peer0.fca.regulatory.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/fca.regulatory.com/users/Admin@fca.regulatory.com/msp
CORE_PEER_ADDRESS=peer0.fca.regulatory.com:7051
CHANNEL_NAME=fcachannel
CORE_PEER_TLS_ENABLED=true



verifyResult () {
	if [ $1 -ne 0 ] ; then
		echo "!!!!!!!!!!!!!!! "$2" !!!!!!!!!!!!!!!!"
                echo "================== ERROR !!! FAILED to execute End-2-End Scenario =================="
		echo
   		exit 1
	fi
}
queryChaincode () {
	# while 'peer chaincode' command can get the orderer endpoint from the peer (if join was successful),
	# lets supply it directly as we know it using the "-o" option

	peer chaincode invoke -o orderer.regulatory.com:7050  --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n mycontract -c '{"Args":["invoke","a","b","10"]}' >&log.txt
	res=$?
	cat log.txt
	verifyResult $res "Chaincode instantiation on PEER on channel '$CHANNEL_NAME' failed"
	echo "===================== Chaincode Instantiation on PEER on channel '$CHANNEL_NAME' is successful ===================== "
	echo
}

queryChaincode
