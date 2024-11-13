# Bash scripts
Collection of bash scripts
# How to use
Make the scripts executable with
```bash
chmod +x script-name.sh
```
**Place the scripts in the /usr/bin directory.** _Alternatively, you can place them in a custom directory and then include it in the PATH variable._
```bash
export PATH=$PATH:path/to/your/script.sh
```
For scripts for the nemo file manager, place in ~/.local/share/nemo/scripts
# List of scripts
## Global scripts
1. [pick](pick) – Picks a random argument. Allows for weighted randomization.
## Nemo scripts
2. [swap-names](nemo-scripts/swap-names) – Swaps the names of two selected files.
3. [group-by-date](nemo-scripts/group-by-date) – Groups selected files by date, moving them into directories based on their year and month of creation.
4. [copy-path](nemo-scripts/copy-path) – Copies path to selected file to clipboard.
