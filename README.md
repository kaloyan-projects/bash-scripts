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
For scripts for the Nemo file manager, place in ~/.local/share/nemo/scripts
For actions for the Nemo file manager, place in ~/.local/share/nemo/actions
# List of scripts
## Global scripts
1. [pick](pick) – Picks a random argument. Allows for weighted randomization.
2. [fakeprogress](fakeprogress) – Counts from one to specified number, with the specified interval, mimicking progress information in CLI programs.
## Nemo scripts
3. [swap-names](nemo-scripts/swap-names) – Swaps the names of two selected files.
4. [group-by-date](nemo-scripts/group-by-date) – Groups selected files by date, moving them into directories based on their year and month of creation.
5. [copy-path](nemo-scripts/copy-path) – Copies path to selected file to clipboard.
## Nemo actions
6. [copy-full-path](nemo-actions/copy-full-path.nemo_action) – Copies path to selected file to clipboard.
7. [extract-subtitles](nemo-actions/extract-subtitles.sh) – Extracts all subtitle tracks of the selected video files. Works only on video formats.
8. [copy-length-to-clipboard](nemo-actions/copy-length-to-clipboard.sh) – Copies the total length of all selected videos to the cipboard. Works only on video formats.
