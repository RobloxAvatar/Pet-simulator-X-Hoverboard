getgenv().bind = "q" --// choose a keybind
getgenv().bordToggled = false --// dont change this

local gmppath = require(game:GetService("ReplicatedStorage").Framework.Modules.Client["5 | Gamepasses"])
gmppath.Owns = function() return true end

game:GetService("UserInputService").InputBegan:Connect(function(i)
    if i.KeyCode == Enum.KeyCode[string.upper(getgenv().bind)] then
        if getgenv().bordToggled == false then
            getgenv().bordToggled = true
            local ohTable1 = {
	            [1] = true
            }
            workspace.__THINGS.__REMOTES["update hoverboard state"]:FireServer(ohTable1)
            getgenv().bordToggled = true
        else
            if getgenv().bordToggled == true then
                getgenv().bordToggled = false
                local ohTable1 = {
	                [1] = false
                }
                workspace.__THINGS.__REMOTES["update hoverboard state"]:FireServer(ohTable1)
                getgenv().bordToggled = false
            end
        end
    end
end)
