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