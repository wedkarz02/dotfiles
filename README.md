# .files

This repo is just a messy collection of my personal config files.
Feel free to grab anything that seems interesting to you. \
**Please review everything in this repo before running the bootstrap. It was configured to work on my system and might ruin yours if you're not careful. Use at your own risk!**

# Download

To download this repository use the ```git clone``` command:
```bash
$ git clone https://github.com/wedkarz02/dotfiles.git
```

# Usage
To update your config files ```source``` the ```bootstrap.sh``` script:
```bash
$ cd dotfiles/
$ source bootstrap.sh
```

The script will prompt you with one last warning: 
<br />
<br />
<mark><span style="color:#ff444b; font-weight:bold">[Warning]</span> This may overwrite existing files in your home directory. Are you sure? (y/n)</mark>
<br />
<br />
which you can skip with ```--force``` or ```-f``` flag:
```bash
$ source bootstrap.sh --force
```

# Thanks to:
 - [Mathias Bynens](https://github.com/mathiasbynens) for the basic bootstrap script from his [dotfiles](https://github.com/mathiasbynens/dotfiles).
