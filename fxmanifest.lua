--[[
    disable-idle-afk-cam - Disable Idle (AFK) Camera / 禁用闲置（AFK）相机
    Author: TEARLESSVVOID
    Version: 1.0.0
    Repository: https://github.com/TEARLESSVVOID/FiveM---Disable-the-idle-Afk-cam
--]]

fx_version 'cerulean'        -- FiveM fx_version / FiveM 引擎版本
game 'gta5'                  -- 适用游戏：GTA5
lua54 'yes'                  -- 启用 Lua 5.4（可选，禁用同样可用）/ Enable Lua 5.4 (optional, works either way)

author 'TEARLESSVVOID'
version '1.0.0'
name 'Disable Idle AFK Cam'
description 'Disable the idle/AFK camera in FiveM / 在 FiveM 中禁用闲置（AFK）相机'

shared_scripts {
    'config.lua',            -- 共享配置 / Shared config
}

client_scripts {
    'client.lua',            -- 客户端逻辑 / Client logic
}

server_scripts {
    'server.lua',            -- 服务端逻辑 / Server logic
}
