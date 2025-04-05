-- 阻止服务器端触发的 Knockout 事件
RegisterNetEvent('knockout:server')
AddEventHandler('knockout:server', function(targetId)
    print(("[防击倒] %s 尝试击倒玩家，但已被阻止！"):format(GetPlayerName(source)))
    -- 可以记录日志或惩罚玩家
    -- DropPlayer(source, "禁止使用击倒功能！")
end)

-- 防止客户端滥用事件
AddEventHandler('playerDropped', function(reason)
    if reason:find('knockout') then
        print(("[防击倒] 检测到可疑退出: %s"):format(GetPlayerName(source)))
    end
end)