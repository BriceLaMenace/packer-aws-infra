# VM Frontend – Nginx

Cette VM est générée avec **Packer** et déployée sur **AWS EC2**.  
Elle sert de **serveur web** avec **Nginx** installé automatiquement.

---

## 🛠 Configuration de la VM

- OS de base : Ubuntu 22.04 (image officielle Canonical)
- Serveur web : Nginx
- Système mis à jour (`apt update`)
- Fail2Ban installé (protection brute-force)
- Utilisateur `packer` / mot de passe `packer`

---

## 📁 Fichiers du dossier

frontend/
├── packer.json # Fichier Packer principal (template AMI).
├── README.md # Documentation de cette VM.
└── scripts/.
└── install-nginx.sh # Script shell exécuté par Packer pour installer Nginx.


---

## ⚙️ Détail du fichier `packer.json`

- **Builder :** `amazon-ebs` → création d'une AMI dans AWS
- **AMI source :** Ubuntu 22.04 LTS (jammy)
- **Instance utilisée pour le build :** `t2.micro`
- **Provisioning :**
  - Exécution d’un script `install-nginx.sh`
  - Installation de Fail2Ban
  - Création de l’utilisateur `packer`

---

## 🚀 Commandes Packer à exécuter

Dans le terminal, depuis `frontend/` :

```bash
packer validate packer.json     # Vérifie que la syntaxe est correcte
packer build packer.json        # Lance la création de l’AMI AWS
packer inspect packer.json       # Affiche les détails de l'AMI créée
```
