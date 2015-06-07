# tmux current power

Enables displaying power consumption in tmux status-right.


### Usage

Add `#{power_consumption}` format strings to existing `status-right` tmux option. Example:

    # in .tmux.conf
    set -g status-right "C#{cpu_percentage} B#{battery_percentage} W#{power_consumption}| %a %h-%d %H:%M "

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @tpm_plugins '               \
      tmux-plugins/tpm                  \
      manuelmazzuola/tmux-current-power \
    '
