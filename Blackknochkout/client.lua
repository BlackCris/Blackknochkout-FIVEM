local isAntiKnockoutEnabled = true
local lastCheck = 0  -- 防频繁检测

-- 1. 禁用潜行 + 防 Spam
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)  -- 降低检测频率（200ms）

        if not isAntiKnockoutEnabled then 
            return 
        end

        local playerPed = PlayerPedId()
        local currentTime = GetGameTimer()

        -- 每 500ms 检测一次潜行（防止高频切换）
        if currentTime - lastCheck > 500 then
            if GetPedStealthMovement(playerPed) then
                SetPedStealthMovement(playerPed, false)
            end
            lastCheck = currentTime
        end

        -- 禁用 Ragdoll（仅初始化时设置，避免重复调用）
        SetPedCanRagdoll(playerPed, false)
        SetPedConfigFlag(playerPed, 32, false)  -- 禁用近战击倒
    end
end)

-- 2. 拦截击倒事件（只注册一次，不在循环内！）
RegisterNetEvent('knockout:client', function()
    if isAntiKnockoutEnabled then
        CancelEvent()  -- 直接取消事件
        TriggerEvent('chat:addMessage', { args = { '^1[防击倒]', '击倒已被阻止！' } })
    end
end)

-- 3. 强制恢复 Ragdoll（仅在触发时执行，非循环）
AddEventHandler('gameEventTriggered', function(eventName, args)
    if eventName == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        if victim == PlayerPedId() and IsPedRagdoll(victim) then
            ClearPedTasksImmediately(victim)
            SetPedToRagdoll(victim, 1, 1, 0, false, false, false)
        end
    end
end)