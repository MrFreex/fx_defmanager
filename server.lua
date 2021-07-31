local deferrals = {

}

function AddDeferralToQueue(priority,cb,resource)
    local defcache = {}
    
    local push = false
    if priority then
        defcache[1] = { cb, resource }
    else
        push = true
    end

    for k,e in pairs(deferrals) do
        defcache[k] = e
    end

    if push then
        table.insert(defcache,{ cb, resource })
    end

    deferrals = defcache
end

function Proceed(name,ctk,def,_S,count)
    if count == #deferrals then
        def.done()
        return
    end

    count = count + 1

    deferrals[count][1](name,ctk,def,_S,count,Proceed)
end


AddEventHandler("playerConnecting",function (name,ctk,def)
    local _S = source
    def.defer()
    Citizen.Wait(10)
    Citizen.CreateThread(function ()
        deferrals[1][1](name,ctk,def,_S,1,Proceed)
    end)
end)

exports("AddDeferralToQueue", AddDeferralToQueue)