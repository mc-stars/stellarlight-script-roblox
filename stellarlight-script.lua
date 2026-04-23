local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local RunService=game:GetService("RunService")

local LocalPlayer=Players.LocalPlayer
local PlayerGui=LocalPlayer.PlayerGui

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

local ScreenGui=Instance.new("ScreenGui")
ScreenGui.Name="Stellarlight"
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn=false
ScreenGui.Parent=PlayerGui

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
LogoContainer.Name="LogoContainer"
LogoContainer.Size=UDim2.new(1,0,0,70)
LogoContainer.BackgroundTransparency=1
LogoContainer.Parent=Sidebar

local LogoIcon=Instance.new("ImageLabel")
LogoIcon.Name="LogoIcon"
LogoIcon.Size=UDim2.new(0,32,0,32)
LogoIcon.Position=UDim2.new(0,20,0.5,-16)
LogoIcon.BackgroundTransparency=1
LogoIcon.Image="rbxassetid://15486315973"
LogoIcon.ImageColor3=Colors.Accent
LogoIcon.Parent=LogoContainer

local LogoText=Instance.new("TextLabel")
LogoText.Name="LogoText"
LogoText.Size=UDim2.new(1,-64,0,24)
LogoText.Position=UDim2.new(0,64,0.5,-12)
LogoText.BackgroundTransparency=1
LogoText.Text="Stellarlight"
LogoText.TextColor3=Colors.Text
LogoText.TextSize=18
LogoText.Font=Enum.Font.GothamBold
LogoText.TextXAlignment=Enum.TextXAlignment.Left
LogoText.Parent=LogoContainer
local NavContainer=Instance.new("Frame")
NavContainer.Name="NavContainer"
NavContainer.Size=UDim2.new(1,-20,1,-90)
NavContainer.Position=UDim2.new(0,10,0,80)
NavContainer.BackgroundTransparency=1
NavContainer.Parent=Sidebar

local function CreateNavButton(name,icon,selected)
    local Button=Instance.new("TextButton")
    Button.Name=name.."Nav"
    Button.Size=UDim2.new(1,0,0,48)
    Button.BackgroundColor3=selected and Colors.Accent or Colors.Sidebar
    Button.BorderSizePixel=0
    Button.Text=""
    Button.AutoButtonColor=false
    Button.Parent=NavContainer

    local ButtonCorner=Instance.new("UICorner")
    ButtonCorner.CornerRadius=UDim.new(0,6)
    ButtonCorner.Parent=Button

    local Icon=Instance.new("ImageLabel")
    Icon.Name="Icon"
    Icon.Size=UDim2.new(0,20,0,20)
    Icon.Position=UDim2.new(0,16,0.5,-10)
    Icon.BackgroundTransparency=1
    Icon.Image=icon
    Icon.ImageColor3=selected and Colors.Text or Colors.TextSecondary
    Icon.Parent=Button

    local Text=Instance.new("TextLabel")
    Text.Name="Text"
    Text.Size=UDim2.new(1,-52,0,20)
    Text.Position=UDim2.new(0,48,0.5,-10)
    Text.BackgroundTransparency=1
    Text.Text=name
    Text.TextColor3=selected and Colors.Text or Colors.TextSecondary
    Text.TextSize=16
    Text.Font=Enum.Font.GothamMedium
    Text.TextXAlignment=Enum.TextXAlignment.Left
    Text.Parent=Button

    local Dropdown=Instance.new("ImageLabel")
    Dropdown.Name="Dropdown"
    Dropdown.Size=UDim2.new(0,12,0,12)
    Dropdown.Position=UDim2.new(1,-22,0.5,-6)
    Dropdown.BackgroundTransparency=1
    Dropdown.Image="rbxassetid://15486327311"
    Dropdown.ImageColor3=selected and Colors.Text or Colors.TextSecondary
    Dropdown.Parent=Button

    return Button
end

local PlayerNav=CreateNavButton("玩家","rbxassetid://15486332779",false)
PlayerNav.Position=UDim2.new(0,0,0,0)
local VisualNav=CreateNavButton("视觉","rbxassetid://15486336705",false)
VisualNav.Position=UDim2.new(0,0,0,58)
local GameNav=CreateNavButton("游戏","rbxassetid://15486340209",true)
GameNav.Position=UDim2.new(0,0,0,116)
local ToolsNav=CreateNavButton("工具","rbxassetid://15486343621",false)
ToolsNav.Position=UDim2.new(0,0,0,174)
local SettingsNav=CreateNavButton("设置","rbxassetid://15486347013",false)
SettingsNav.Position=UDim2.new(0,0,0,232)

local ContentArea=Instance.new("Frame")
ContentArea.Name="ContentArea"
ContentArea.Size=UDim2.new(1,-220,1,0)
ContentArea.Position=UDim2.new(0,220,0,0)
ContentArea.BackgroundTransparency=1
ContentArea.Parent=MainContainer

local TopBar=Instance.new("Frame")
TopBar.Name="TopBar"
TopBar.Size=UDim2.new(1,0,0,70)
TopBar.BackgroundTransparency=1
TopBar.Parent=ContentArea

local SearchBar=Instance.new("TextBox")
SearchBar.Name="SearchBar"
SearchBar.Size=UDim2.new(1,-160,0,40)
SearchBar.Position=UDim2.new(0,20,0.5,-20)
SearchBar.BackgroundColor3=Colors.Card
SearchBar.BorderSizePixel=0
SearchBar.Text=""
SearchBar.PlaceholderText="Search for a function"
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

local SearchIcon=Instance.new("ImageLabel")
SearchIcon.Name="SearchIcon"
SearchIcon.Size=UDim2.new(0,16,0,16)
SearchIcon.Position=UDim2.new(0,12,0.5,-8)
SearchIcon.BackgroundTransparency=1
SearchIcon.Image="rbxassetid://15486350325"
SearchIcon.ImageColor3=Colors.TextSecondary
SearchIcon.Parent=SearchBar

SearchBar.TextXAlignment=Enum.TextXAlignment.Left
SearchBar.ClipsDescendants=true
local SearchTextPadding=Instance.new("UIPadding")
SearchTextPadding.PaddingLeft=UDim.new(0,40)
SearchTextPadding.Parent=SearchBar
local TopRightButtons=Instance.new("Frame")
TopRightButtons.Name="TopRightButtons"
TopRightButtons.Size=UDim2.new(0,120,0,40)
TopRightButtons.Position=UDim2.new(1,-140,0.5,-20)
TopRightButtons.BackgroundTransparency=1
TopRightButtons.Parent=TopBar

local PinButton=Instance.new("TextButton")
PinButton.Name="PinButton"
PinButton.Size=UDim2.new(0,40,0,40)
PinButton.Position=UDim2.new(0,0,0,0)
PinButton.BackgroundColor3=Colors.Card
PinButton.BorderSizePixel=0
PinButton.Text=""
PinButton.AutoButtonColor=false
PinButton.Parent=TopRightButtons

local PinCorner=Instance.new("UICorner")
PinCorner.CornerRadius=UDim.new(0,6)
PinCorner.Parent=PinButton

local PinIcon=Instance.new("ImageLabel")
PinIcon.Name="PinIcon"
PinIcon.Size=UDim2.new(0,16,0,16)
PinIcon.Position=UDim2.new(0.5,-8,0.5,-8)
PinIcon.BackgroundTransparency=1
PinIcon.Image="rbxassetid://15486353637"
PinIcon.ImageColor3=Colors.TextSecondary
PinIcon.Parent=PinButton

local MinimizeButton=Instance.new("TextButton")
MinimizeButton.Name="MinimizeButton"
MinimizeButton.Size=UDim2.new(0,40,0,40)
MinimizeButton.Position=UDim2.new(0,45,0,0)
MinimizeButton.BackgroundColor3=Colors.Card
MinimizeButton.BorderSizePixel=0
MinimizeButton.Text=""
MinimizeButton.AutoButtonColor=false
MinimizeButton.Parent=TopRightButtons

local MinimizeCorner=Instance.new("UICorner")
MinimizeCorner.CornerRadius=UDim.new(0,6)
MinimizeCorner.Parent=MinimizeButton

local MinimizeIcon=Instance.new("ImageLabel")
MinimizeIcon.Name="MinimizeIcon"
MinimizeIcon.Size=UDim2.new(0,16,0,16)
MinimizeIcon.Position=UDim2.new(0.5,-8,0.5,-8)
MinimizeIcon.BackgroundTransparency=1
MinimizeIcon.Image="rbxassetid://15486356949"
MinimizeIcon.ImageColor3=Colors.TextSecondary
MinimizeIcon.Parent=MinimizeButton

local CloseButton=Instance.new("TextButton")
CloseButton.Name="CloseButton"
CloseButton.Size=UDim2.new(0,40,0,40)
CloseButton.Position=UDim2.new(0,90,0,0)
CloseButton.BackgroundColor3=Colors.Card
CloseButton.BorderSizePixel=0
CloseButton.Text=""
CloseButton.AutoButtonColor=false
CloseButton.Parent=TopRightButtons

local CloseCorner=Instance.new("UICorner")
CloseCorner.CornerRadius=UDim.new(0,6)
CloseCorner.Parent=CloseButton

local CloseIcon=Instance.new("ImageLabel")
CloseIcon.Name="CloseIcon"
CloseIcon.Size=UDim2.new(0,16,0,16)
CloseIcon.Position=UDim2.new(0.5,-8,0.5,-8)
CloseIcon.BackgroundTransparency=1
CloseIcon.Image="rbxassetid://15486360261"
CloseIcon.ImageColor3=Colors.TextSecondary
CloseIcon.Parent=CloseButton

local FunctionList=Instance.new("ScrollingFrame")
FunctionList.Name="FunctionList"
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
local function CreateFunctionItem(name,hasKeybind,hasSettings)
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
    Checkbox.Name="Checkbox"
    Checkbox.Size=UDim2.new(0,18,0,18)
    Checkbox.Position=UDim2.new(1,-22,0.5,-9)
    Checkbox.BackgroundColor3=Colors.CheckboxUnchecked
    Checkbox.BorderSizePixel=0
    Checkbox.Text=""
    Checkbox.AutoButtonColor=false
    Checkbox.Parent=Item

    local CheckboxCorner=Instance.new("UICorner")
    CheckboxCorner.CornerRadius=UDim.new(0,4)
    CheckboxCorner.Parent=Checkbox

    local Checkmark=Instance.new("ImageLabel")
    Checkmark.Name="Checkmark"
    Checkmark.Size=UDim2.new(0,12,0,12)
    Checkmark.Position=UDim2.new(0.5,-6,0.5,-6)
    Checkmark.BackgroundTransparency=1
    Checkmark.Image="rbxassetid://15486363573"
    Checkmark.ImageColor3=Colors.Text
    Checkmark.Visible=false
    Checkmark.Parent=Checkbox

    local FunctionName=Instance.new("TextLabel")
    FunctionName.Name="FunctionName"
    FunctionName.Size=UDim2.new(1,-100,0,20)
    FunctionName.Position=UDim2.new(0,16,0.5,-10)
    FunctionName.BackgroundTransparency=1
    FunctionName.Text=name
    FunctionName.TextColor3=Colors.Text
    FunctionName.TextSize=14
    FunctionName.Font=Enum.Font.Gotham
    FunctionName.TextXAlignment=Enum.TextXAlignment.Left
    FunctionName.Parent=Item

    if hasKeybind then
        local Keybind=Instance.new("TextLabel")
        Keybind.Name="Keybind"
        Keybind.Size=UDim2.new(0,24,0,20)
        Keybind.Position=UDim2.new(1,-50,0.5,-10)
        Keybind.BackgroundTransparency=1
        Keybind.Text="F2"
        Keybind.TextColor3=Colors.TextSecondary
        Keybind.TextSize=12
        Keybind.Font=Enum.Font.Gotham
        Keybind.TextXAlignment=Enum.TextXAlignment.Center
        Keybind.Parent=Item
    end

    if hasSettings then
        local SettingsButton=Instance.new("TextButton")
        SettingsButton.Name="SettingsButton"
        SettingsButton.Size=UDim2.new(0,16,0,16)
        SettingsButton.Position=UDim2.new(1,-70,0.5,-8)
        SettingsButton.BackgroundTransparency=1
        SettingsButton.Text=""
        SettingsButton.AutoButtonColor=false
        SettingsButton.Parent=Item

        local SettingsIcon=Instance.new("ImageLabel")
        SettingsIcon.Name="SettingsIcon"
        SettingsIcon.Size=UDim2.new(0,16,0,16)
        SettingsIcon.Position=UDim2.new(0.5,-8,0.5,-8)
        SettingsIcon.BackgroundTransparency=1
        SettingsIcon.Image="rbxassetid://15486366885"
        SettingsIcon.ImageColor3=Colors.TextSecondary
        SettingsIcon.Parent=SettingsButton
    end

    local enabled=false
    Checkbox.MouseButton1Click:Connect(function()
        enabled=not enabled
        Checkbox.BackgroundColor3=enabled and Colors.Checkbox or Colors.CheckboxUnchecked
        Checkmark.Visible=enabled
        Item.BackgroundColor3=enabled and Colors.AccentDark or Colors.Card
    end)

    return Item
end

CreateFunctionItem("Infinite Yield",true,true)
CreateFunctionItem("Walk Speed",true,true)
CreateFunctionItem("Jump Power",true,true)
CreateFunctionItem("Noclip",true,true)
CreateFunctionItem("Fly",true,true)
CreateFunctionItem("No Fall Damage",true,false)
CreateFunctionItem("ESP",true,true)
CreateFunctionItem("Hitbox Expander",true,true)
CreateFunctionItem("Auto Clicker",true,true)
CreateFunctionItem("Fullbright",true,false)
CreateFunctionItem("Infinite Jump",true,false)

FunctionList.CanvasSize=UDim2.new(0,0,0,ListLayout.AbsoluteContentSize.Y)
local ToggleButton=Instance.new("TextButton")
ToggleButton.Name="ToggleButton"
ToggleButton.Size=UDim2.new(0,50,0,50)
ToggleButton.Position=UDim2.new(0,20,0.5,-25)
ToggleButton.BackgroundColor3=Colors.Sidebar
ToggleButton.BorderSizePixel=0
ToggleButton.Text=""
ToggleButton.AutoButtonColor=false
ToggleButton.Visible=true
ToggleButton.Parent=ScreenGui

local ToggleCorner=Instance.new("UICorner")
ToggleCorner.CornerRadius=UDim.new(0,12)
ToggleCorner.Parent=ToggleButton

local ToggleIcon=Instance.new("ImageLabel")
ToggleIcon.Name="ToggleIcon"
ToggleIcon.Size=UDim2.new(0,24,0,24)
ToggleIcon.Position=UDim2.new(0.5,-12,0.5,-12)
ToggleIcon.BackgroundTransparency=1
ToggleIcon.Image="rbxassetid://15486315973"
ToggleIcon.ImageColor3=Colors.Accent
ToggleIcon.Parent=ToggleButton

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
    if input.KeyCode==Enum.KeyCode.RightShift then
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
