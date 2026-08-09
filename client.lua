--[[
    disable-idle-afk-cam - Client Logic / 客户端逻辑
    Author: TEARLESSVVOID

    References / 参考资料:
    - Forum thread: https://forum.cfx.re/t/how-to-disable-afk-cam/4812707
    - Native: DisableIdleCamera / https://docs.fivem.net/natives/?_0x32FEAC20C44D8B01
--]]

local enabled = true                   -- 当前禁用状态 / Current disabled state
local kvpKey = 'afk_cam_enabled'       -- KVP 存储键 / KVP storage key

--[[
    加载玩家个人设置（KVP）
    Load the player's personal setting (KVP)
    说明：使用字符串存储 'on'/'off'，未设置时默认为开启。
    注：不可用 GetResourceKvpInt，因为未设置与"已关闭"都返回 0。
    Note: store as string 'on'/'off' — default ON when unset.
    (GetResourceKvpInt returns 0 both for "unset" and "off", so it is unusable.)
--]]
CreateThread(function()
    Wait(100)
    local saved = GetResourceKvpString(kvpKey) -- 读取 KVP / Read KVP
    if saved == 'off' then
        enabled = false
    end
end)

--[[
    核心循环 / Main loop
    根据论坛讨论：仅调用一次偶尔会失效（例如 30 秒后相机重新出现），
    因此使用低频率循环持续重新断言状态，开销极小。
    Per the forum: calling once may occasionally fail (camera returns after
    ~30s), so we re-assert with a low-frequency loop, which is very cheap.
--]]
if Config.loopEnabled then
    CreateThread(function()
        Wait(Config.initialDelay) -- 初始等待，让游戏就绪 / Initial wait for the game to settle

        while true do
            if enabled then
                DisableIdleCamera(true) -- 禁用闲置相机 / Disable the idle camera
            end

            Wait(Config.loopInterval) -- 休眠，避免忙循环 / Sleep to avoid a busy loop
        end
    end)
else
    -- 单次调用模式（最省资源，但可能偶发失效）/ Single-call mode (cheapest, but can occasionally fail)
    DisableIdleCamera(true)
end

--[[
    通知函数 / Notification helper
--]]
local function notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(true, false)
end

--[[
    命令切换 / Toggle command
    玩家可随时用命令开启/关闭本功能（每玩家独立，KVP 持久化）
    Players can toggle the feature per-player (persisted via KVP)
--]]
if Config.enableCommand then
    RegisterCommand(Config.commandName, function()
        enabled = not enabled

        SetResourceKvpString(kvpKey, enabled and 'on' or 'off') -- 保存玩家设置 / Save player setting

        if Config.notifyEnabled then
            notify(enabled and Config.notifyOn or Config.notifyOff)
        end
    end, false)
end
