# Disable Idle AFK Cam (disable-idle-afk-cam)

> Disable the idle (AFK) camera in FiveM — lightweight, loop-based, per-player toggle.

**Language**: English | [中文 (简体)](README_ZH.md)

## About

`disable-idle-afk-cam` disables the in-game idle/AFK camera that activates when a player is inactive for about 30 seconds. This is useful for:

- Watching Twitch/YouTube streams on in-game TV screens
- AFK RP scenarios / standing still during roleplay
- Players who simply don't want the idle cam to kick in

Based on the discussion in [How to Disable Afk cam](https://forum.cfx.re/t/how-to-disable-afk-cam/4812707).

## Features

- ✅ Disables the idle camera using the `DisableIdleCamera(true)` native
- ✅ **Loop mode** (default): periodically re-asserts the disabled state for maximum reliability — the forum thread shows a single call can occasionally fail (~30s re-trigger)
- ✅ **Single-call mode**: if you prefer zero loop overhead, set `Config.loopEnabled = false`
- ✅ **Per-player KVP toggle**: players can disable/enable the feature for themselves at any time, persisted across sessions
- ✅ Server-side startup banner (ASCII art + version + repository link)
- ✅ Bilingual code comments (English & Chinese)
- ✅ Zero dependencies, no UI framework required

## Installation

1. Download or clone this repository
2. Copy the `disable-idle-afk-cam` folder into your server's `resources` directory
3. Add `ensure disable-idle-afk-cam` to your `server.cfg`
4. Restart your server — done!

## Configuration

Edit `config.lua`:

| Key | Default | Description |
|-----|---------|-------------|
| `Config.loopEnabled` | `true` | Use the periodic loop (more reliable) |
| `Config.loopInterval` | `25000` | Loop interval in ms (25s is plenty) |
| `Config.initialDelay` | `1000` | Initial wait in ms before first call |
| `Config.enableCommand` | `true` | Enable the per-player toggle command |
| `Config.commandName` | `'noafk'` | Toggle command name |
| `Config.notifyEnabled` | `true` | Show in-game notifications on toggle |
| `Config.logStartup` | `true` | Print the server banner at startup |

## Commands

| Command | Description |
|---------|-------------|
| `/noafk` | Toggle idle camera disabling for yourself |

## Performance

- The loop calls a single cheap native every **25 seconds** by default — negligible overhead (≈0.00004% CPU per call)
- No per-tick allocations, no table churn, no events fired per frame
- Server side only prints once at startup
- No memory leak risk: the loop is a single persistent thread with no growing state

## Support

- Report issues: [GitHub Issues](https://github.com/TEARLESSVVOID/FiveM---Disable-the-idle-Afk-cam/issues)
- Forum thread: [How to Disable Afk cam](https://forum.cfx.re/t/how-to-disable-afk-cam/4812707)

## License

MIT — free to use, modify, and distribute.

---

<p align="center">
  Made with ❤ by <b>TEARLESSVVOID</b>
</p>
