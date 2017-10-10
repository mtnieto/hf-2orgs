# Setting up a Hyperledger Fabric Network #

In the following repository there are basic skeletons for the network creation.

https://github.com/hlf-go/fabrics


## Files ##
The following files will be modified to create the configuration desired.

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

## Executing the network ##

### Run the network ###
Once the configuration is defined and all the files modified, to run the network execute the following command:

```
./fabricOps.sh start
```

NOTE: Now, you have an environment to deploy and to interact chaincodes. It's very important that the chaincode is deployed in the same docker network than the peers.
To check this execute the following command
```
docker inspect "name_of_a_peer_container
```
With this information, the next step is going to the file /base/peer-base.yaml.

The name of the network must correspond to the following line value. If it is different, when a chaincode will be instanciate its docker container will be created and immediately will be killed.

```
- CORE_VM_DOCKER_HOSTCONFIG_NETWORKMODE=hf2orgs_default

```
### Delete and modify the network ###
With every change in the configuration it is necessary to execute the following command:

```
./fabricOps.sh clean

```

NOTE: You must not delete the command line in the script where the docker images are removed.

### Interact with the network ####
To interact with the network creating channels, joining peers and interacting with the chaincode, execute the following command:

```
./fabricOps.sh cli
```
Once we are in the docker container of the hyperledger cli tool we can execute the following commands:

```
./scripts/01-createchannel.sh //a channel is created
./scripts/02-joinBank.sh // An organization joins in to the channel
./scripts/03-joinRegulator.sh //Another organization joins into the channel
./script/04-installBank.sh // The chaincode is installed in the bank peers
./script/06-instanciate.sh // The chaincode is instanciated in the network and a docker-container of the chaincode is created
```
