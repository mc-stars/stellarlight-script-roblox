repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer.PlayerGui
repeat task.wait() until workspace.CurrentCamera
local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")
local Workspace=game:GetService("Workspace")
local LocalPlayer=Players.LocalPlayer
local PlayerGui=LocalPlayer.PlayerGui
local Camera=Workspace.CurrentCamera
local Colors={
    Background=Color3.fromHex("#1A1E23"),
    Sidebar=Color3.fromHex("#21262D"),
    Card=Color3.fromHex("#272C33"),
    Accent=Color3.fromHex("#2ECC71"),
    AccentDark=Color3.fromHex("#27AE60"),
    Text=Color3.fromHex("#FFFFFF"),
    TextSecondary=Color3.fromHex("#8B949E"),
    Border=Color3.fromHex("#30363D"),
    Checkbox=Color3.fromHex("#2ECC71"),
    CheckboxUnchecked=Color3.fromHex("#484F58")
}
local Lang={
    CN={
        Logo="Stellarlight",
        Player="玩家",
        Visual="视觉",
        Game="游戏",
        Tools="工具",
        Settings="设置",
        Search="搜索功能",
        Fly="飞行",
        Noclip="穿墙",
        WalkSpeed="移动速度",
        JumpPower="跳跃高度",
        InfiniteJump="无限跳",
        NoFall="无摔落伤害",
        GodMode="无敌",
        ESP="全局透视",
        ESPName="显示名字",
        ESPHealth="显示血量",
        ESPDistance="显示距离",
        ESPBox="方框透视",
        Fullbright="全亮",
        NoFog="无雾",
        NightVision="夜视",
        Aimbot="自动瞄准",
        NoRecoil="无后坐力",
        FastShoot="快速射击",
        HitboxExpander="命中盒扩大",
        AutoClick="自动点击",
        AutoCollect="自动收集",
        TimeSpeed="时间加速",
        WeatherControl="天气控制",
        RemoveFog="移除迷雾",
        Language="语言切换",
        ResetUI="重置UI位置",
        Unload="卸载脚本",
        Loading="正在加载 Stellarlight",
        Loaded="加载完成"
    }
}
local CurrentLang=Lang.CN
local ScreenGui=Instance.new("ScreenGui")
ScreenGui.Name="Stellarlight"
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn=false
ScreenGui.Parent=PlayerGui
local ToggleButton=Instance.new("TextButton")
ToggleButton.Name="ToggleButton"
ToggleButton.Size=UDim2.new(0,50,0,50)
ToggleButton.Position=UDim2.new(0,20,0.5,-25)
ToggleButton.BackgroundColor3=Colors.Sidebar
ToggleButton.BorderSizePixel=0
ToggleButton.Text="M"
ToggleButton.TextColor3=Colors.Accent
ToggleButton.TextSize=24
ToggleButton.Font=Enum.Font.GothamBold
ToggleButton.AutoButtonColor=false
ToggleButton.Visible=false
ToggleButton.Parent=ScreenGui
local ToggleCorner=Instance.new("UICorner")
ToggleCorner.CornerRadius=UDim.new(0,12)
ToggleCorner.Parent=ToggleButton
local LoadingScreen=Instance.new("Frame")
LoadingScreen.Size=UDim2.new(1,0,1,0)
LoadingScreen.BackgroundColor3=Color3.new(0,0,0)
LoadingScreen.BackgroundTransparency=0
LoadingScreen.Parent=ScreenGui
local LoadingText=Instance.new("TextLabel")
LoadingText.Size=UDim2.new(1,0,0,30)
LoadingText.Position=UDim2.new(0,0,0.5,0)
LoadingText.BackgroundTransparency=1
LoadingText.Text=CurrentLang.Loading
LoadingText.TextColor3=Colors.Text
LoadingText.TextSize=24
LoadingText.Font=Enum.Font.GothamBold
LoadingText.Parent=LoadingScreen
local ProgressBar=Instance.new("Frame")
ProgressBar.Size=UDim2.new(0,400,0,6)
ProgressBar.Position=UDim2.new(0.5,-200,0.55,0)
ProgressBar.BackgroundColor3=Colors.Card
ProgressBar.Parent=LoadingScreen
local ProgressFill=Instance.new("Frame")
ProgressFill.Size=UDim2.new(0,0,1,0)
ProgressFill.BackgroundColor3=Colors.Accent
ProgressFill.Parent=ProgressBar
local UICorner1=Instance.new("UICorner")
UICorner1.CornerRadius=UDim.new(0,3)
UICorner1.Parent=ProgressBar
local UICorner2=Instance.new("UICorner")
UICorner2.CornerRadius=UDim.new(0,3)
UICorner2.Parent=ProgressFill
local MainContainer=Instance.new("Frame")
MainContainer.Name="MainContainer"
MainContainer.Size=UDim2.new(0,900,0,600)
MainContainer.Position=UDim2.new(0.5,-450,0.5,-300)
MainContainer.BackgroundColor3=Colors.Background
MainContainer.BorderSizePixel=0
MainContainer.Visible=false
MainContainer.ClipsDescendants=true
MainContainer.Parent=ScreenGui
local UICorner=Instance.new("UICorner")
UICorner.CornerRadius=UDim.new(0,8)
UICorner.Parent=MainContainer
local Sidebar=Instance.new("Frame")
Sidebar.Name="Sidebar"
Sidebar.Size=UDim2.new(0,220,1,0)
Sidebar.BackgroundColor3=Colors.Sidebar
Sidebar.BorderSizePixel=0
Sidebar.Parent=MainContainer
local LogoContainer=Instance.new("Frame")
LogoContainer.Size=UDim2.new(1,0,0,70)
LogoContainer.BackgroundTransparency=1
LogoContainer.Parent=Sidebar
local LogoText=Instance.new("TextLabel")
LogoText.Size=UDim2.new(1,-40,0,24)
LogoText.Position=UDim2.new(0,20,0.5,-12)
LogoText.BackgroundTransparency=1
LogoText.Text=CurrentLang.Logo
LogoText.TextColor3=Colors.Text
LogoText.TextSize=18
LogoText.Font=Enum.Font.GothamBold
LogoText.TextXAlignment=Enum.TextXAlignment.Left
LogoText.Parent=LogoContainer
local NavContainer=Instance.new("Frame")
NavContainer.Size=UDim2.new(1,-20,1,-90)
NavContainer.Position=UDim2.new(0,10,0,80)
NavContainer.BackgroundTransparency=1
NavContainer.Parent=Sidebar
local NavButtons={}
local function CreateNavButton(name,selected)
    local Button=Instance.new("TextButton")
    Button.Name=name.."Nav"
    Button.Size=UDim2.new(1,0,0,48)
    Button.BackgroundColor3=selected and Colors.Accent or Colors.Sidebar
    Button.BorderSizePixel=0
    Button.Text=CurrentLang[name]
    Button.TextColor3=selected and Colors.Text or Colors.TextSecondary
    Button.TextSize=16
    Button.Font=Enum.Font.GothamMedium
    Button.TextXAlignment=Enum.TextXAlignment.Left
    Button.AutoButtonColor=false
    Button.Parent=NavContainer
    local ButtonCorner=Instance.new("UICorner")
    ButtonCorner.CornerRadius=UDim.new(0,6)
    ButtonCorner.Parent=Button
    local TextPadding=Instance.new("UIPadding")
    TextPadding.PaddingLeft=UDim.new(0,16)
    TextPadding.Parent=Button
    table.insert(NavButtons,{Button=Button,Name=name})
    return Button
end
local PlayerNav=CreateNavButton("Player",false)
PlayerNav.Position=UDim2.new(0,0,0,0)
local VisualNav=CreateNavButton("Visual",false)
VisualNav.Position=UDim2.new(0,0,0,58)
local GameNav=CreateNavButton("Game",true)
GameNav.Position=UDim2.new(0,0,0,116)
local ToolsNav=CreateNavButton("Tools",false)
ToolsNav.Position=UDim2.new(0,0,0,174)
local SettingsNav=CreateNavButton("Settings",false)
SettingsNav.Position=UDim2.new(0,0,0,232)
local ContentArea=Instance.new("Frame")
ContentArea.Size=UDim2.new(1,-220,1,0)
ContentArea.Position=UDim2.new(0,220,0,0)
ContentArea.BackgroundTransparency=1
ContentArea.Parent=MainContainer
local TopBar=Instance.new("Frame")
TopBar.Size=UDim2.new(1,0,0,70)
TopBar.BackgroundTransparency=1
TopBar.Parent=ContentArea
local SearchBar=Instance.new("TextBox")
SearchBar.Size=UDim2.new(1,-160,0,40)
SearchBar.Position=UDim2.new(0,20,0.5,-20)
SearchBar.BackgroundColor3=Colors.Card
SearchBar.BorderSizePixel=0
SearchBar.Text=""
SearchBar.PlaceholderText=CurrentLang.Search
SearchBar.PlaceholderColor3=Colors.TextSecondary
SearchBar.TextColor3=Colors.Text
SearchBar.TextSize=14
SearchBar.Font=Enum.Font.Gotham
SearchBar.TextXAlignment=Enum.TextXAlignment.Left
SearchBar.ClearTextOnFocus=false
SearchBar.Parent=TopBar
local SearchCorner=Instance.new("UICorner")
SearchCorner.CornerRadius=UDim.new(0,6)
SearchCorner.Parent=SearchBar
local SearchTextPadding=Instance.new("UIPadding")
SearchTextPadding.PaddingLeft=UDim.new(0,16)
SearchTextPadding.Parent=SearchBar
local TopRightButtons=Instance.new("Frame")
TopRightButtons.Size=UDim2.new(0,120,0,40)
TopRightButtons.Position=UDim2.new(1,-140,0.5,-20)
TopRightButtons.BackgroundTransparency=1
TopRightButtons.Parent=TopBar
local MinimizeButton=Instance.new("TextButton")
MinimizeButton.Size=UDim2.new(0,40,0,40)
MinimizeButton.Position=UDim2.new(0,45,0,0)
MinimizeButton.BackgroundColor3=Colors.Card
MinimizeButton.BorderSizePixel=0
MinimizeButton.Text="-"
MinimizeButton.TextColor3=Colors.TextSecondary
MinimizeButton.TextSize=20
MinimizeButton.Font=Enum.Font.GothamBold
MinimizeButton.AutoButtonColor=false
MinimizeButton.Parent=TopRightButtons
local MinimizeCorner=Instance.new("UICorner")
MinimizeCorner.CornerRadius=UDim.new(0,6)
MinimizeCorner.Parent=MinimizeButton
local CloseButton=Instance.new("TextButton")
CloseButton.Size=UDim2.new(0,40,0,40)
CloseButton.Position=UDim2.new(0,90,0,0)
CloseButton.BackgroundColor3=Colors.Card
CloseButton.BorderSizePixel=0
CloseButton.Text="×"
CloseButton.TextColor3=Colors.TextSecondary
CloseButton.TextSize=20
CloseButton.Font=Enum.Font.GothamBold
CloseButton.AutoButtonColor=false
CloseButton.Parent=TopRightButtons
local CloseCorner=Instance.new("UICorner")
CloseCorner.CornerRadius=UDim.new(0,6)
CloseCorner.Parent=CloseButton
local FunctionList=Instance.new("ScrollingFrame")
FunctionList.Size=UDim2.new(1,-40,1,-90)
FunctionList.Position=UDim2.new(0,20,0,80)
FunctionList.BackgroundTransparency=1
FunctionList.ScrollBarThickness=4
FunctionList.ScrollBarColor3=Colors.Border
FunctionList.CanvasSize=UDim2.new(0,0,0,0)
FunctionList.Parent=ContentArea
local ListLayout=Instance.new("UIListLayout")
ListLayout.Padding=UDim.new(0,8)
ListLayout.SortOrder=Enum.SortOrder.LayoutOrder
ListLayout.Parent=FunctionList
local ListPadding=Instance.new("UIPadding")
ListPadding.PaddingBottom=UDim.new(0,20)
ListPadding.Parent=FunctionList
local Toggles={}
local function CreateToggle(name,default,callback)
    local Item=Instance.new("Frame")
    Item.Name=name
    Item.Size=UDim2.new(1,0,0,44)
    Item.BackgroundColor3=Colors.Card
    Item.BorderSizePixel=0
    Item.LayoutOrder=#FunctionList:GetChildren()-2
    Item.Parent=FunctionList
    local ItemCorner=Instance.new("UICorner")
    ItemCorner.CornerRadius=UDim.new(0,6)
    ItemCorner.Parent=Item
    local Checkbox=Instance.new("TextButton")
    Checkbox.Size=UDim2.new(0,18,0,18)
    Checkbox.Position=UDim2.new(1,-22,0.5,-9)
    Checkbox.BackgroundColor3=default and Colors.Checkbox or Colors.CheckboxUnchecked
    Checkbox.BorderSizePixel=0
    Checkbox.Text=""
    Checkbox.AutoButtonColor=false
    Checkbox.Parent=Item
    local CheckboxCorner=Instance.new("UICorner")
    CheckboxCorner.CornerRadius=UDim.new(0,4)
    CheckboxCorner.Parent=Checkbox
    local FunctionName=Instance.new("TextLabel")
    FunctionName.Size=UDim2.new(1,-100,0,20)
    FunctionName.Position=UDim2.new(0,16,0.5,-10)
    FunctionName.BackgroundTransparency=1
    FunctionName.Text=CurrentLang[name]
    FunctionName.TextColor3=Colors.Text
    FunctionName.TextSize=14
    FunctionName.Font=Enum.Font.Gotham
    FunctionName.TextXAlignment=Enum.TextXAlignment.Left
    FunctionName.Parent=Item
    Toggles[name]=default
    Checkbox.MouseButton1Click:Connect(function()
        Toggles[name]=not Toggles[name]
        Checkbox.BackgroundColor3=Toggles[name] and Colors.Checkbox or Colors.CheckboxUnchecked
        Item.BackgroundColor3=Toggles[name] and Colors.AccentDark or Colors.Card
        if callback then pcall(callback,Toggles[name]) end
    end)
    return Item
end
local function ClearFunctions()
    for _,v in pairs(FunctionList:GetChildren())do
        if v:IsA("Frame")then v:Destroy()end
    end
end
local function LoadPlayerTab()
    ClearFunctions()
    CreateToggle("Fly",false,function(v)
        local char=LocalPlayer.Character
        if not char then return end
        local root=char:FindFirstChild("HumanoidRootPart")
        local hum=char:FindFirstChild("Humanoid")
        if v then
            hum.PlatformStand=true
            local bv=Instance.new("BodyVelocity")
            bv.Name="ST_Fly"
            bv.MaxForce=Vector3.new(1e8,1e8,1e8)
            bv.Parent=root
            local bg=Instance.new("BodyGyro")
            bg.Name="ST_FlyGyro"
            bg.MaxTorque=Vector3.new(1e8,1e8,1e8)
            bg.Parent=root
        else
            hum.PlatformStand=false
            if root:FindFirstChild("ST_Fly")then root.ST_Fly:Destroy()end
            if root:FindFirstChild("ST_FlyGyro")then root.ST_FlyGyro:Destroy()end
        end
    end)
    CreateToggle("Noclip",false)
    CreateToggle("WalkSpeed",false)
    CreateToggle("JumpPower",false)
    CreateToggle("InfiniteJump",false)
    CreateToggle("NoFall",false)
    CreateToggle("GodMode",false)
    FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
end
local function LoadVisualTab()
    ClearFunctions()
    CreateToggle("ESP",false)
    CreateToggle("ESPName",true)
    CreateToggle("ESPHealth",true)
    CreateToggle("ESPDistance",true)
    CreateToggle("ESPBox",true)
    CreateToggle("Fullbright",false,function(v)
        game.Lighting.Brightness=v and 3 or 1
        game.Lighting.Contrast=v and 0.5 or 0
    end)
    CreateToggle("NoFog",false,function(v)
        game.Lighting.FogEnd=v and 1e5 or 1000
    end)
    CreateToggle("NightVision",false)
    FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
end
local function LoadGameTab()
    ClearFunctions()
    CreateToggle("Aimbot",false)
    CreateToggle("NoRecoil",false)
    CreateToggle("FastShoot",false)
    CreateToggle("HitboxExpander",false)
    FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
end
local function LoadToolsTab()
    ClearFunctions()
    CreateToggle("AutoClick",false)
    CreateToggle("AutoCollect",false)
    CreateToggle("TimeSpeed",false)
    CreateToggle("WeatherControl",false)
    CreateToggle("RemoveFog",false)
    FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
end
local function LoadSettingsTab()
    ClearFunctions()
    local LangItem=Instance.new("Frame")
    LangItem.Size=UDim2.new(1,0,0,44)
    LangItem.BackgroundColor3=Colors.Card
    LangItem.Parent=FunctionList
    local LangCorner=Instance.new("UICorner")
    LangCorner.CornerRadius=UDim.new(0,6)
    LangCorner.Parent=LangItem
    local LangText=Instance.new("TextLabel")
    LangText.Size=UDim2.new(1,-100,0,20)
    LangText.Position=UDim2.new(0,16,0.5,-10)
    LangText.BackgroundTransparency=1
    LangText.Text=CurrentLang.Language
    LangText.TextColor3=Colors.Text
    LangText.TextSize=14
    LangText.Font=Enum.Font.Gotham
    LangText.TextXAlignment=Enum.TextXAlignment.Left
    LangText.Parent=LangItem
    local LangBtn=Instance.new("TextButton")
    LangBtn.Size=UDim2.new(0,60,0,28)
    LangBtn.Position=UDim2.new(1,-70,0.5,-14)
    LangBtn.BackgroundColor3=Colors.Accent
    LangBtn.Text="CN"
    LangBtn.TextColor3=Colors.Text
    LangBtn.TextSize=12
    LangBtn.Font=Enum.Font.GothamBold
    LangBtn.Parent=LangItem
    local LangBtnCorner=Instance.new("UICorner")
    LangBtnCorner.CornerRadius=UDim.new(0,4)
    LangBtnCorner.Parent=LangBtn
    CreateToggle("ResetUI",false,function()
        MainContainer.Position=UDim2.new(0.5,-450,0.5,-300)
        ToggleButton.Position=UDim2.new(0,20,0.5,-25)
    end)
    CreateToggle("Unload",false,function()
        ScreenGui:Destroy()
    end)
    FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
end
PlayerNav.MouseButton1Click:Connect(LoadPlayerTab)
VisualNav.MouseButton1Click:Connect(LoadVisualTab)
GameNav.MouseButton1Click:Connect(LoadGameTab)
ToolsNav.MouseButton1Click:Connect(LoadToolsTab)
SettingsNav.MouseButton1Click:Connect(LoadSettingsTab)
LoadGameTab()
local draggingToggle=false
local dragToggleStart=Vector2.new()
local toggleStartPos=UDim2.new()
ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingToggle=true
        dragToggleStart=Vector2.new(input.Position.X,input.Position.Y)
        toggleStartPos=ToggleButton.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if draggingToggle and input.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=Vector2.new(input.Position.X,input.Position.Y)-dragToggleStart
        ToggleButton.Position=UDim2.new(toggleStartPos.X.Scale,toggleStartPos.X.Offset+delta.X,toggleStartPos.Y.Scale,toggleStartPos.Y.Offset+delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingToggle=false
    end
end)
ToggleButton.MouseButton1Click:Connect(function()
    MainContainer.Visible=not MainContainer.Visible
end)
UIS.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode.F1 then
        MainContainer.Visible=not MainContainer.Visible
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    MainContainer.Visible=false
end)
MinimizeButton.MouseButton1Click:Connect(function()
    MainContainer.Visible=false
end)
local dragging=false
local dragStart=Vector2.new()
local startPos=UDim2.new()
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=Vector2.new(input.Position.X,input.Position.Y)
        startPos=MainContainer.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=Vector2.new(input.Position.X,input.Position.Y)-dragStart
        MainContainer.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=false
    end
end)
coroutine.wrap(function()
    pcall(function()
        for i=1,100 do
            ProgressFill.Size=UDim2.new(i/100,0,1,0)
            task.wait(0.02)
        end
        LoadingText.Text=CurrentLang.Loaded
        task.wait(0.5)
        TweenService:Create(LoadingScreen,TweenInfo.new(0.8),{BackgroundTransparency=1}):Play()
        TweenService:Create(LoadingText,TweenInfo.new(0.8),{Transparency=1}):Play()
        TweenService:Create(ProgressBar,TweenInfo.new(0.8),{Transparency=1}):Play()
        task.wait(0.8)
        LoadingScreen:Destroy()
        ToggleButton.Visible=true
    end)
end)()
RunService.RenderStepped:Connect(function()
    pcall(function()
        local char=LocalPlayer.Character
        if not char then return end
        local root=char:FindFirstChild("HumanoidRootPart")
        local hum=char:FindFirstChild("Humanoid")
        if not root or not hum then return end
        if Toggles.Fly then
            local bv=root:FindFirstChild("ST_Fly")
            local bg=root:FindFirstChild("ST_FlyGyro")
            if bv and bg then
                bv.Velocity=Vector3.new(0,0,0)
                if UIS:IsKeyDown(Enum.KeyCode.W)then bv.Velocity=root.CFrame.LookVector*60 end
                if UIS:IsKeyDown(Enum.KeyCode.S)then bv.Velocity=-root.CFrame.LookVector*60 end
                if UIS:IsKeyDown(Enum.KeyCode.A)then bv.Velocity=-root.CFrame.RightVector*60 end
                if UIS:IsKeyDown(Enum.KeyCode.D)then bv.Velocity=root.CFrame.RightVector*60 end
                if UIS:IsKeyDown(Enum.KeyCode.Space)then bv.Velocity=Vector3.new(0,60,0)end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl)then bv.Velocity=Vector3.new(0,-60,0)end
                bg.CFrame=CFrame.new(root.Position,root.Position+Camera.CFrame.LookVector)
            end
        end
        hum.WalkSpeed=Toggles.WalkSpeed and 50 or 16
        hum.JumpPower=Toggles.JumpPower and 150 or 50
        if Toggles.InfiniteJump then hum.JumpPower=150 end
        if Toggles.NoFall then hum.FallDamagePerSecond=0 end
        if Toggles.GodMode then hum.Health=hum.MaxHealth end
        if Toggles.Noclip then
            for _,v in pairs(char:GetDescendants())do
                if v:IsA("BasePart")then v.CanCollide=false end
            end
        end
    end)
end)
