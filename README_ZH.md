# Disable Idle AFK Cam（disable-idle-afk-cam）

> 在 FiveM 中禁用闲置（AFK）相机 —— 轻量、循环式、支持玩家个人开关。

**语言**: [English](README.md) | 中文（简体）

## 关于

`disable-idle-afk-cam` 用于禁用玩家闲置约 30 秒后自动触发的游戏内闲置（AFK）相机。适用于以下场景：

- 在游戏内电视屏幕上看 Twitch/YouTube 直播
- AFK 角色扮演场景 / 站桩挂机时
- 单纯不想让闲置相机干扰游玩

本资源基于论坛讨论：[How to Disable Afk cam](https://forum.cfx.re/t/how-to-disable-afk-cam/4812707)。

## 功能特性

- ✅ 使用 `DisableIdleCamera(true)` 原生函数禁用闲置相机
- ✅ **循环模式**（默认）：周期性重新断言禁用状态，可靠性最高 —— 论坛讨论指出仅调用一次偶尔会失效（约 30 秒后再次触发）
- ✅ **单次调用模式**：若想零循环开销，可将 `Config.loopEnabled` 设为 `false`
- ✅ **玩家个人 KVP 开关**：玩家可随时单独开启/关闭本功能，跨会话持久化
- ✅ 服务端启动横幅（艺术字 + 版本号 + 仓库链接）
- ✅ 代码注释中英双语
- ✅ 零依赖，无需任何 UI 框架

## 安装

1. 下载或克隆本仓库
2. 将 `disable-idle-afk-cam` 文件夹复制到服务器的 `resources` 目录
3. 在 `server.cfg` 中添加 `ensure disable-idle-afk-cam`
4. 重启服务器 —— 完成！

## 配置

编辑 `config.lua`：

| 键 | 默认值 | 说明 |
|----|--------|------|
| `Config.loopEnabled` | `true` | 使用周期性循环（更可靠） |
| `Config.loopInterval` | `30000` | 循环间隔（毫秒），30 秒足够 |
| `Config.initialDelay` | `1000` | 首次调用前的初始等待（毫秒） |
| `Config.enableCommand` | `true` | 启用玩家个人切换命令 |
| `Config.commandName` | `'noafk'` | 切换命令名 |
| `Config.notifyEnabled` | `true` | 切换时显示游戏内通知 |
| `Config.logStartup` | `true` | 启动时打印服务端横幅 |

## 命令

| 命令 | 说明 |
|------|------|
| `/noafk` | 为自己切换闲置相机禁用状态 |

## 性能

- 循环默认每 **30 秒**调用一次轻量原生函数 —— 开销可忽略（每次调用约 0.00003% CPU）
- 无逐帧分配、无表增长、无每帧事件触发
- 服务端仅在启动时打印一次日志
- 无内存泄漏风险：单个常驻线程，无持续增长的状态

## 支持

- 问题反馈：[GitHub Issues](https://github.com/TEARLESSVVOID/FiveM---Disable-the-idle-Afk-cam/issues)
- 论坛帖子：[How to Disable Afk cam](https://forum.cfx.re/t/how-to-disable-afk-cam/4812707)

## 许可证

MIT —— 可自由使用、修改与分发。

---

<p align="center">
  由 <b>TEARLESSVVOID</b> 用心制作 ❤
</p>
