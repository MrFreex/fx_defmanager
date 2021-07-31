# fx_defmanager
 A simple deferrals manager for fiveM
 
 ITA
 
 Come utilizzarlo
 
 Si utilizza tramite l'export serverside: "AddDeferralToQueue"

Parametri: priority(true,false),callback,resourcename

il callback ha i seguenti parametri:

Name : nome del player
calltokick : se chiamata kicka il player
deferrals : object che contiene le funzioni deferral
source
count : variabile di sistema, non toccare
Proceed : callback per il termine dell'esecuzione; ha come parametri richiesti: Name,calltokick,deferrals,source,count

Esempio:

```
exports["fx_defmanager"]:AddDeferralToQueue(true,function (name,calltokick,def,_S,count,Proceed)
    def.defer()
    Citizen.Wait(0)
    def.update('🌪️ Init')
    ...
    Proceed(name,calltokick,def,_S,count)
end, GetCurrentResourceName())
```

ENG

How to use the resource

This resource works via the "AddDeferralToQueue" server-sided export

Parameters: priority(true,false),callback,resourcename

the callback receives the following parameters:

Name : player name
calltokick : kicks the player if called
deferrals : deferrals object
source
count : system variable, it represents the deferral that is currently being executed. Do not overwrite it.
Proceed : callback to terminate the execution, it needs the following parameters: Name,calltokick,deferrals,source,count

Example

```
exports["fx_defmanager"]:AddDeferralToQueue(true,function (name,calltokick,def,_S,count,Proceed)
    def.defer()
    Citizen.Wait(0)
    def.update('🌪️ Init')
    ...
    Proceed(name,calltokick,def,_S,count)
end, GetCurrentResourceName())
```
