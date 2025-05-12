~/.config/Thunar/uca.xml

~/.config/Thunar/accels.scm 

```bash

#!/bin/bash

cd ~/.config/Thunar/
sudo rm -f accels.scm uca.xml uca.xml.bak
git clone https://github.com/GlitchLinux/Thunar-Right-Click-Scripts.git
cd Thunar-Right-Click-Scripts
sudo mv -f accels.scm ~/.config/Thunar/
sudo mv -f uca.xml ~/.config/Thunar/
cd .. && sudo rm -r Thunar-Right-Click-Scripts
sudo chmod +x ~/.config/Thunar/accels.scm
sudo chmod +x ~/.config/Thunar/uca.xml

# DEPENDENCIES

sudo apt update

# Install core dependencies
sudo apt install -y \
    bash \
    coreutils \
    xclip \
    tree \
    p7zip-full \
    qemu-system-x86 \
    ovmf \
    ark \
    kdialog \
    zenity \
    nano \
    thunar \
    xfce4-terminal \
    python3 \
    shred \
    ffmpeg \
    libnotify-bin \
    exo-utils 
```
