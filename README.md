# Setting up a Hyperledger Fabric Network #

In the following repository there are basic skeletons for the network creation.

https://github.com/hlf-go/fabrics


## Files ##
The following files will be modified to create the configuration wanted.

### crypto-config.yaml ###

In this file is established the definition of the organizations, peers for organization and the configuration of the orederer.

### configtx.yaml ##

In this file is established the channel configurations, how many channel, what organizations are in a channel, etc.

### base/docker-compose-base.yaml ###
It is necessary to change the hosts and the paths of the crypto materials according the configuration of the 2 files previous.

### docker-compose-template.yaml
It is also necessary necessary to change the hosts and the paths of the crypto materials.

### fabricOps.sh ###
Modify the two following methods

1. replacePrivateKey:
Change the paths of the cryptomaterials

2. generateChannelArtifacts: Modify the following command lines

```
$GOPATH/bin/configtxgen -profile FCAOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

$GOPATH/bin/configtxgen -profile fcachannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID "fcachannel"

```
It is necessary to be equal to the variables defined in the configtx.yaml file. Be careful with the channelID, uppercases are considered like ilegal characters.
