--[[
    disable-idle-afk-cam - Shared Configuration / 共享配置文件
    Author: TEARLESSVVOID
--]]

Config = {}

--[[
    Loop settings / 循环设置
    ------------------------------------------------------------
    根据论坛讨论（https://forum.cfx.re/t/how-to-disable-afk-cam/4812707），
    单独调用一次 DisableIdleCamera(true) 大多数时候有效，
    但某些情况下（其他脚本重置状态 / 游戏内部恢复）闲置相机会再次出现。
    Based on the forum discussion, calling DisableIdleCamera(true) once
    usually works, but in some cases (other scripts / game state resets)
    the idle camera can come back, so we re-assert it periodically.
--]]
Config.loopEnabled = true    -- 启用周期性循环调用（更可靠）/ Enable periodic loop call (more reliable)
Config.loopInterval = 25000  -- 循环间隔毫秒 / Loop interval in milliseconds（默认 30 秒）

-- 首次等待：玩家重生/传送后可能重置状态，首次调用前小延迟更稳妥
-- Initial wait: give the game a moment to settle before first call
Config.initialDelay = 1000   -- 初始延迟毫秒 / Initial delay in milliseconds

--[[
    Player toggle (KVP) / 玩家个人开关（KVP）
    借鉴 NoIdleCam 的做法：每个玩家可以单独开启/关闭。
    Inspired by NoIdleCam: each player can toggle it individually.
--]]
Config.enableCommand = true  -- 启用命令切换 / Enable the toggle command
Config.commandName = 'noafk' -- 切换命令名 / Toggle command name

--[[
    Notifications / 通知
--]]
Config.notifyEnabled = true  -- 启用游戏内通知 / Enable in-game notifications
Config.notifyOn = '闲置相机已禁用' -- AFK camera disabled / 通知文案
Config.notifyOff = '闲置相机已启用' -- AFK camera enabled

--[[
    Server startup log / 服务端启动日志
--]]
Config.logStartup = true     -- 启动时打印艺术字横幅 / Print ASCII banner at startup
Config.version = '1.0.0'     -- 资源版本 / Resource version
Config.repository = 'https://github.com/TEARLESSVVOID/FiveM---Disable-the-idle-Afk-cam' -- 仓库链接 / Repository link
