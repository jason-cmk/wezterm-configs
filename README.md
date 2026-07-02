# WezTerm config

## `config.term = 'wezterm'` — why and what it needs

By default WezTerm advertises itself as `TERM=xterm-256color`, a conservative
lowest-common-denominator that hides capabilities WezTerm actually has — most
importantly **synchronized updates** (DEC 2026). Without it, tmux repaints
unsynchronized and TUI apps (Ink dashboards, etc.) flicker badly inside tmux.

`config.term = 'wezterm'` fixes that, but the `wezterm` terminfo must be
installed on **every host where you run terminal programs** (locally, and any
ssh target), or those programs will complain `'wezterm': unknown terminal type`.

### Install the terminfo (once per host, no root needed)

```bash
tempfile=$(mktemp) \
  && curl -fsS -o $tempfile https://raw.githubusercontent.com/wezterm/wezterm/main/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
```

- `curl` fetches the terminfo *source* (a text description of WezTerm's capabilities)
- `tic` compiles it into the binary database ncurses programs read, into `~/.terminfo`

### Verify tmux picked it up

TERM only applies to newly opened tabs, and tmux reads client features at
attach — so after changing this, open a fresh tab and restart the tmux server
(`tmux kill-server`), then:

```bash
echo $TERM                                  # outside tmux → wezterm
tmux display -p '#{client_termfeatures}'    # should include: sync
```

### ssh to hosts without the terminfo

Either run the install one-liner on that host (full capabilities survive the
hop), or downgrade TERM just for ssh via `~/.ssh/config` (OpenSSH ≥ 8.7):

```
# Downgrade TERM for remote hosts that lack the wezterm terminfo
Host *
    SetEnv TERM=xterm-256color
```

The two compose: keep `Host *` as the safe default and carve out exceptions
for hosts where you've installed the terminfo.
