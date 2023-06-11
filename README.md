# uc-arch-v2

##### The provided Bash script is a simple program that offers some functionalities for managing packages on a Linux system using the "pacman" package manager and the "yay" utility for AUR packages. The script starts by clearing the screen and displaying an ASCII art logo. Includes a function called "check_yay" that checks if the "yay" utility is installed on the system. If  is not, the user is prompted to install it. If confirmed, the script executes the `sudo pacman -S yay` command to install "yay". Also provides functions for updating pacman packages and AUR packages. There are also functions for cleaning orphaned packages and the pacman cache. The "clean_orphans" function uses the `pacman -Qdtq` command to obtain the orphaned packages and then executes `sudo pacman -Rns` to remove them. The "clean_cache" function checks the cache size using the "du -sh" command and, if the size is not zero, it executes "sudo pacman -Sc" to clean the cache. The user can select an option by entering the corresponding number. In case of invalid input, an error message is displayed.


![alt text](img1.png)

## Start without local installation:

before running script make executable with:

```
chmod +x uc-arch-v2.sh
```

then:

```
./uc-arch-v2.sh
```

## Make a local installation:

- clone the repo
```
git clone https://github.com/giuseppetnt/uc-arch-v2.git
```

- enter the directory
```
cd uc-arch-v2
```

- compile and install
```
makepkg -si
```

- start with
```
uc-arch-v2.sh
```


### Sponsor

### Main sponsor

![alt text](Blenderchannel.png)

www.blenderchannel.it