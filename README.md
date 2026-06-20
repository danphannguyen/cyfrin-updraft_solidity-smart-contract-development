# cyfrin-updraft_solidity-smart-contract-development



# 📝 Note sur le fichier `.resolution-index.json`
Ce fichier est généré automatiquement par le compilateur de Remix IDE. Il sert de **cache local** pour cartographier et mémoriser l'emplacement des dépendances externes (comme les imports de contrats OpenZeppelin). 
Étant propre à la session de navigation en cours, il n'a aucune valeur pour le code source et est donc **exclu du versioning** via le `.gitignore`.

# Nice to know

## Solidity is case sensitive 

## Multiple version
Lorsque l'on travail avec plusieurs fichiers, il faut s'assurer que les versions de solidity soient compatible.
Tout les fichiers doivent être au minimum sur la même version de X et Y dans X.Y.ZZ

Exemple : 
    Fichier 1 : 0.8.18
    Fichier 2 : 0.8.16
    Version commune : 0.8.18 (version la plus haute)

    Fichier 1 : 0.8.18
    Fichier 2 : 0.7.12
    Version commune : Impossible (Solidity prendra 0.7.12 mais cela ne pourra pas fonctionner)

## Les trasactions failed consomment du gas

## Champs d'une transaction
- Nonce : tx count for the account
- Gas Price : price per unit of gas (in wei)
- to address that the tx is sent to
- Value : amount of wei to send 
- Data : what to send to the To address
- v, r, s: components of tx signature

## Chainlink Oracles
Docs : https://docs.chain.link/docs/get-the-latest-price

Les oracles permettent de récupérer des données du monde réel. 
On ne peut pas utiliser un serveur centealisé ou une API qui introduirait un "single point of failure" ce qui casserait totalement l'essence de la blockchain

Un oracle est donc un ensemble de nodes décentralisés a qui on va poser une question.
Chacun des nodes va répondre, et un node va se charger d'aggréger toutes les données et signatures pour transmettre une réponse
Exemple : https://data.chain.link

Ces nodes sont rémunéré par les GAS fee
Un système de réputation à été mis en place pour bannier/punir les nodes potentiellement malveillant

**NB : Pour tester les orcales j'ai du basculer sur Brave car MetaMask ne fonctionne pas sur arc**
Faucet : https://cloud.google.com/application/web3/faucet/ethereum/sepolia

## Chainlink VRF (Verifiable Random Function)
Docs : https://docs.chain.link/vrf

Permet de récupérer/générer de la vraie "randomness" car sur la blockchain cette randomness est souvent simulé et donc prévisible.
Cela la rend donc vulnérable

## Chainlink Keepers / Chainlink Automations
Docs : https://automation.chain.link/

## E2E Reliability is the promise of smart contracts (Chainlink functions)
Docs : https://docs.chain.link/chainlink-functions



