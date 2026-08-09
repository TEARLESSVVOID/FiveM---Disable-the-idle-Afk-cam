--[[
    disable-idle-afk-cam - Server Logic / 服务端逻辑
    Author: TEARLESSVVOID
    功能：启动时在控制台打印艺术字横幅（含版本号与仓库链接）
    Purpose: print an ASCII art banner (with version and repo link) at startup
--]]

local version = Config.version or 'unknown'   -- 版本号 / Version number
local repository = Config.repository or 'N/A' -- 仓库链接 / Repository link

--[[
    ASCII 艺术字横幅（服务端日志输出）
    ASCII art banner (server console output)
--]]
local banner = table.concat({
    [[----------------------------------------------------------------]],
    [[    _    _____ _  __   ____    _    __  __    ___  _____ _____  ]],
    [[   / \  |  ___| |/ /  / ___|  / \  |  \/  |  / _ \|  ___|  ___| ]],
    [[  / _ \ | |_  | ' /  | |     / _ \ | |\/| | | | | | |_  | |_    ]],
    [[ / ___ \|  _| | . \  | |___ / ___ \| |  | | | |_| |  _| |  _|   ]],
    [[/_/   \_\_|   |_|\_\  \____/_/   \_\_|  |_|  \___/|_|   |_|     ]],
    [[                                                                ]],
    [[   Disable Idle (AFK) Camera / 禁用闲置（AFK）相机               ]],
    [[                                                                ]],
    [[   Version / 版本: ]] .. version,
    [[   Repository / 仓库: ]] .. repository,
    [[   Author / 作者: TEARLESSVVOID                                  ]],
    [[   Docs: https://forum.cfx.re/t/how-to-disable-afk-cam/4812707  ]],
    [[----------------------------------------------------------------]],
}, '\n')

--[[
    启动日志：仅在资源启动时打印一次，不占用额外运行时开销
    Startup log: printed only once at resource start; no runtime cost
--]]
if Config.logStartup then
    CreateThread(function()
        print(banner) -- 输出艺术字横幅 / Print the ASCII banner
    end)
end
