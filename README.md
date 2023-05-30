# nixos-config

# Instalation
## Partitioning
In this exaple I have disk sda.
### UEFI
```
parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart primary 512MiB -16GiB
parted /dev/sda -- mkpart primary linux-swap -16GiB 100%
parted /dev/sda -- mkpart ESP fat32 1MiB 512MiB
parted /dev/sda -- set 3 esp on
```
### Legacy
```
parted /dev/sda -- mklabel msdos
parted /dev/sda -- mkpart primary 1MiB -16GiB
parted /dev/sda -- set 1 boot on
parted /dev/sda -- mkpart primary linux-swap -16GiB 100%
```

## Formatting

### Unenecrypted drive
```
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt
mkswap /dev/sda2
swapon /dev/sda2
```
On UEFI do this:
```
mkfs.fat -F32 /dev/sda3
mkdir -p /mnt/boot
mount /dev/sda3 /mnt/boot
```

### Encrypted drive
```
cryptsetup luksFormat /dev/sda1
cryptsetup luksOpen /dev/sda1 crypt
mkfs.ext4 /dev/mapper/crypt
mount /dev/mapper/crypt /mnt
mkswap /dev/sda2
swapon /dev/sda2
```
On UEFI do this:
```
mkfs.fat -F32 /dev/sda3
mkdir -p /mnt/boot
mount /dev/sda3 /mnt/boot
```

## Installing
```
nixos-generate-config --root /mnt
nix-shell -p git
git clone https://github.com/DrakulaD3a/nixos-config.git /mnt/etc/nixos/nixos-config
cd /mnt/etc/nixos/nixos-config
cp ../hardware-configuration.nix hosts/<host>
nixos-install --flake .#<host>
```
Awailable hosts:
- desktop
- laptop

## Finalization
1. Reboot
2. Set new user password
3. Move the configuration to your profile
~~~
sudo mv /etc/nixos/nixos-config <preffered location>
~~~
~~~
sudo chown -R <user>:users <new directory location>
~~~
~~~
sudo rm /etc/nixos/configuration.nix
~~~
