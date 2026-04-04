local TweenService=game:GetService("TweenService")
local Players=game:GetService("Players")
local UserInputService=game:GetService("UserInputService")
local RunService=game:GetService("RunService")
local Workspace=game:GetService("Workspace")
local Lighting=game:GetService("Lighting")
local Player=Players.LocalPlayer
local PlayerGui=Player:WaitForChild("PlayerGui")

for _,v in pairs(PlayerGui:GetChildren())do
if v.Name=="ST_UI"then v:Destroy()end
end

local ScreenGui=Instance.new("ScreenGui")
ScreenGui.Name="ST_UI"
ScreenGui.Parent=PlayerGui
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn=true
ScreenGui.DisplayOrder=999

local Colors={
BG=Color3.new(0.93,0.93,0.98),
Stroke=Color3.new(0.8,0.8,0.9),
Text=Color3.new(0,0,0),
On=Color3.new(0,1,0.6),
Off=Color3.new(0.6,0.6,0.6),
Special=Color3.new(1,0.4,0.8)
}

local function notify(msg)
local tip=Instance.new("TextLabel")
tip.Size=UDim2.new(0,260,0,40)
tip.Position=UDim2.new(1,-280,1,-60)
tip.BackgroundColor3=Color3.new(0.1,0.1,0.1)
tip.BackgroundTransparency=0.1
tip.Text="  "..msg
tip.TextXAlignment=Enum.TextXAlignment.Left
tip.TextColor3=Color3.new(1,1,1)
tip.TextSize=16
tip.Font=Enum.Font.GothamBold
tip.CornerRadius=UDim.new(0,8)
tip.Parent=ScreenGui
task.delay(2,function()tip:Destroy()end)
end

local function getChar()
local char=Player.Character or Player.CharacterAdded:Wait()
local hum=char:FindFirstChildOfClass("Humanoid")
return char,hum
end

local function SwitchBtn(parent,text,func)
local frame=Instance.new("Frame")
frame.Size=UDim2.new(1,-10,0,34)
frame.BackgroundTransparency=1
local lbl=Instance.new("TextLabel")
lbl.Size=UDim2.new(0.7,0,1,0)
lbl.BackgroundTransparency=1
lbl.Text="  "..text
lbl.TextXAlignment=Enum.TextXAlignment.Left
lbl.TextColor3=Colors.Text
lbl.TextSize=17
lbl.Font=Enum.Font.GothamBold
lbl.Parent=frame
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(0,50,0,22)
btn.Position=UDim2.new(1,-60,0.5,-11)
btn.BackgroundColor3=Colors.Off
btn.Text="OFF"
btn.TextColor3=Color3.new(1,1,1)
btn.TextSize=14
btn.CornerRadius=UDim.new(1,0)
local enabled=false
local coro
btn.MouseButton1Click:Connect(function()
enabled=not enabled
btn.BackgroundColor3=enabled and Colors.On or Colors.Off
btn.Text=enabled and "ON" or "OFF"
if enabled then
notify(text.." 已开启")
coro=task.spawn(func,true)
else
notify(text.." 已关闭")
if coro then task.cancel(coro)end
func(false)
end
end)
btn.Parent=frame
frame.Parent=parent
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,6)
corner.Parent=btn
end

local function SimpleBtn(parent,text,func)
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,-10,0,34)
btn.BackgroundColor3=Colors.Special
btn.BackgroundTransparency=0.3
btn.Text=text
btn.TextColor3=Colors.Text
btn.TextSize=17
btn.Font=Enum.Font.GothamBold
btn.Parent=parent
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,6)
corner.Parent=btn
btn.MouseButton1Click:Connect(func)
end

local function FoldBtn(parent,text,childfunc)
local fold=false
local frame=Instance.new("Frame")
frame.Size=UDim2.new(1,-10,0,34)
frame.BackgroundTransparency=1
frame.Parent=parent
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,0,1,0)
btn.BackgroundColor3=Colors.Special
btn.BackgroundTransparency=0.3
btn.Text=text.." >"
btn.TextColor3=Colors.Text
btn.TextSize=17
btn.Font=Enum.Font.GothamBold
btn.Parent=frame
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,6)
corner.Parent=btn
local child=Instance.new("Frame")
child.Size=UDim2.new(1,0,0,0)
child.Position=UDim2.new(0,0,1,0)
child.BackgroundTransparency=1
child.Visible=false
child.Parent=frame
local layout=Instance.new("UIListLayout")
layout.Parent=child
layout.Padding=UDim.new(0,4)
childfunc(child)
btn.MouseButton1Click:Connect(function()
fold=not fold
child.Visible=fold
btn.Text=fold and text.." ∨" or text.." >"
local h=0
for _,c in pairs(child:GetChildren())do
if c:IsA("Frame")then h+=38 end
end
child.Size=UDim2.new(1,0,0,fold and h or 0)
end)
end
local function createSpecialMenu(name,func)
local menu=Instance.new("Frame")
menu.Name="SpecialMenu_"..name
menu.AnchorPoint=Vector2.new(0.5,0.5)
menu.Position=UDim2.new(0.5,0,0.5,0)
menu.Size=UDim2.new(0,420,0,340)
menu.BackgroundColor3=Colors.BG
menu.BackgroundTransparency=0.95
menu.Visible=false
menu.Parent=ScreenGui
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,14)
corner.Parent=menu
local stroke=Instance.new("UIStroke")
stroke.Thickness=3
stroke.Color=Colors.Stroke
stroke.Parent=menu
local title=Instance.new("TextLabel")
title.Size=UDim2.new(1,0,0,40)
title.BackgroundTransparency=1
title.Text=name.." 专属"
title.TextColor3=Colors.Text
title.TextSize=20
title.Font=Enum.Font.GothamBlack
title.Parent=menu
local close=Instance.new("TextButton")
close.Size=UDim2.new(0,40,0,40)
close.Position=UDim2.new(1,-40,0,0)
close.BackgroundTransparency=1
close.Text="X"
close.TextColor3=Colors.Text
close.TextSize=20
close.Font=Enum.Font.GothamBold
close.Parent=menu
close.MouseButton1Click:Connect(function()menu.Visible=false end)
local content=Instance.new("Frame")
content.Position=UDim2.new(0,0,0,40)
content.Size=UDim2.new(1,0,1,-40)
content.BackgroundTransparency=1
content.Parent=menu
local layout=Instance.new("UIListLayout")
layout.Parent=content
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.Padding=UDim.new(0,8)
layout.HorizontalAlignment=Enum.HorizontalAlignment.Center
func(content)
return menu
end

local FadeIn=TweenInfo.new(0.8,Enum.EasingStyle.Quad)
local ScaleOut=TweenInfo.new(0.6,Enum.EasingStyle.Back)

local Logo=Instance.new("Frame")
Logo.Name="StartupLogo"
Logo.AnchorPoint=Vector2.new(0.5,0.5)
Logo.Position=UDim2.new(0.5,0,0.5,0)
Logo.Size=UDim2.new(0,180,0,180)
Logo.BackgroundTransparency=1
Logo.Rotation=30
Logo.Parent=ScreenGui

local LogoStroke=Instance.new("UIStroke")
LogoStroke.Thickness=3
LogoStroke.Color=Colors.Stroke
LogoStroke.Transparency=1
LogoStroke.Parent=Logo

local LogoText=Instance.new("TextLabel")
LogoText.AnchorPoint=Vector2.new(0.5,0.5)
LogoText.Position=UDim2.new(0.5,0,0.5,0)
LogoText.Size=UDim2.new(0.7,0,0.7,0)
LogoText.BackgroundTransparency=1
LogoText.Text="ST"
LogoText.TextColor3=Colors.Text
LogoText.TextScaled=true
LogoText.Font=Enum.Font.GothamBlack
LogoText.TextTransparency=1
LogoText.Rotation=-30
LogoText.Parent=Logo

TweenService:Create(LogoStroke,FadeIn,{Transparency=0}):Play()
TweenService:Create(LogoText,FadeIn,{TextTransparency=0}):Play()

task.wait(1.6)

local HideTween=TweenService:Create(Logo,ScaleOut,{Size=UDim2.new(0,0,0,0),Transparency=1})
HideTween:Play()
HideTween.Completed:Connect(function()
Logo:Destroy()

local FloatButton=Instance.new("TextButton")
FloatButton.Name="FloatButton"
FloatButton.Size=UDim2.new(0,70,0,70)
FloatButton.Position=UDim2.new(0,20,0,100)
FloatButton.BackgroundColor3=Colors.Special
FloatButton.BackgroundTransparency=0.2
FloatButton.Text="ST"
FloatButton.TextColor3=Color3.new(1,1,1)
FloatButton.TextSize=22
FloatButton.Font=Enum.Font.GothamBold
FloatButton.Parent=ScreenGui
local fcorner=Instance.new("UICorner")
fcorner.CornerRadius=UDim.new(1,0)
fcorner.Parent=FloatButton

local drag=false
local startPos=nil
local startMouse=nil

FloatButton.MouseButton1Down:Connect(function(x,y)
drag=true
startMouse=Vector2.new(x,y)
startPos=FloatButton.Position
end)

UserInputService.InputChanged:Connect(function(input)
if drag and input.UserInputType==Enum.UserInputType.MouseMovement then
local delta=input.Position - startMouse
FloatButton.Position=UDim2.new(0,startPos.X.Offset+delta.X,0,startPos.Y.Offset+delta.Y)
end
end)

UserInputService.InputEnded:Connect(function()
drag=false
end)
local MainWindow=Instance.new("Frame")
MainWindow.AnchorPoint=Vector2.new(0.5,0.5)
MainWindow.Position=UDim2.new(0.5,0,0.5,0)
MainWindow.Size=UDim2.new(0,540,0,380)
MainWindow.BackgroundColor3=Colors.BG
MainWindow.BackgroundTransparency=0.95
MainWindow.Visible=false
MainWindow.Parent=ScreenGui

local UICorner=Instance.new("UICorner")
UICorner.CornerRadius=UDim.new(0,14)
UICorner.Parent=MainWindow

local MainStroke=Instance.new("UIStroke")
MainStroke.Thickness=3
MainStroke.Color=Colors.Stroke
MainStroke.Parent=MainWindow

local DragArea=Instance.new("Frame")
DragArea.Size=UDim2.new(1,0,0,36)
DragArea.BackgroundTransparency=1
DragArea.Parent=MainWindow

local SideBar=Instance.new("Frame")
SideBar.Position=UDim2.new(0,0,0,36)
SideBar.Size=UDim2.new(0,140,1,-36)
SideBar.BackgroundTransparency=1
SideBar.Parent=MainWindow

local TabNames={"通用","战斗","玩家","渲染","安全","专属"}
local TabFrames={}
local TabButtons={}

local ListLayout=Instance.new("UIListLayout")
ListLayout.Parent=SideBar
ListLayout.SortOrder=Enum.SortOrder.LayoutOrder
ListLayout.Padding=UDim.new(0,6)

for i,name in pairs(TabNames)do
local btn=Instance.new("TextButton")
btn.Size=UDim2.new(1,0,0,36)
btn.BackgroundTransparency=1
btn.Text=name
btn.TextColor3=Colors.Text
btn.Font=Enum.Font.GothamBold
btn.TextSize=17
btn.Parent=SideBar
table.insert(TabButtons,btn)
local frame=Instance.new("Frame")
frame.Position=UDim2.new(0,145,0,36)
frame.Size=UDim2.new(1,-145,1,-36)
frame.BackgroundTransparency=1
frame.Visible=i==1
frame.Parent=MainWindow
TabFrames[name]=frame
local cl=Instance.new("UIListLayout")
cl.Parent=frame
cl.SortOrder=Enum.SortOrder.LayoutOrder
cl.Padding=UDim.new(0,8)
cl.HorizontalAlignment=Enum.HorizontalAlignment.Center
end

for i,btn in pairs(TabButtons)do
btn.MouseButton1Click:Connect(function()
for _,f in pairs(TabFrames)do f.Visible=false end
TabFrames[TabNames[i]].Visible=true
end)
end

do
local tab=TabFrames["通用"]
SwitchBtn(tab,"无限体力",function(e)
local con
con=RunService.Heartbeat:Connect(function()
if not e then con:Disconnect()return end
local _,hum=getChar()
if hum then hum.Stamina=hum.MaxStamina end
end)
end)
SwitchBtn(tab,"防摔落伤害",function(e)
Player.CharacterAdded:Connect(function(c)
local hum=c:FindFirstChildOfClass("Humanoid")
if hum then hum.FallDamageEnabled=not e end
end)
end)
SwitchBtn(tab,"水下呼吸",function(e)
RunService.Heartbeat:Connect(function()
local _,hum=getChar()
if hum then hum:SetStateEnabled(Enum.HumanoidStateType.Drowning,false) end
end)
end)
SimpleBtn(tab,"重置角色",function()
Player:LoadCharacter()
notify("角色已重置")
end)
FoldBtn(tab,"枪战通用",function(gun)
SwitchBtn(gun,"自动锁头",function(e)end)
SwitchBtn(gun,"无后坐力",function(e)end)
SwitchBtn(gun,"快速换弹",function(e)end)
SwitchBtn(gun,"枪械透视",function(e)end)
end)
end

do
local tab=TabFrames["战斗"]
SwitchBtn(tab,"无限生命",function(e)
RunService.Heartbeat:Connect(function()
local _,hum=getChar()
if hum then hum.Health=hum.MaxHealth end
end)
end)
SwitchBtn(tab,"不会死亡",function(e)
Player.CharacterAdded:Connect(function(c)
local hum=c:FindFirstChildOfClass("Humanoid")
if hum then hum.BreakJointsOnDeath=not e end
end)
end)
end

do
local tab=TabFrames["玩家"]
SwitchBtn(tab,"无限跳跃",function(e)end)
SwitchBtn(tab,"超级速度",function(e)end)
SwitchBtn(tab,"飞行模式",function(e)end)
end

do
local tab=TabFrames["渲染"]
SwitchBtn(tab,"高亮玩家",function(e)end)
SwitchBtn(tab,"无迷雾",function(e)end)
end

do
local tab=TabFrames["安全"]
SwitchBtn(tab,"隐藏名字",function(e)end)
SimpleBtn(tab,"清理痕迹",function()
for _,v in pairs(ScreenGui:GetChildren())do
if v:IsA("TextLabel")or v.Name:find("SpecialMenu")then v:Destroy()end
end
notify("已清理")
end)
end

do
local tab=TabFrames["专属"]
SimpleBtn(tab,"自然灾害模拟器",function()
createSpecialMenu("自然灾害模拟器",function(c)
SwitchBtn(c,"免疫灾害",function()end)
SwitchBtn(c,"无限氧气",function()end)
end).Visible=true
end)
SimpleBtn(tab,"DOORS",function()
createSpecialMenu("DOORS",function(c)
SwitchBtn(c,"无敌",function()end)
SwitchBtn(c,"透视门",function()end)
end).Visible=true
end)
SimpleBtn(tab,"谁是杀手",function()
createSpecialMenu("谁是杀手",function(c)
SwitchBtn(c,"透视杀手",function()end)
end).Visible=true
end)
end

local dragWin=false
DragArea.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 then
dragWin=true
end
end)
UserInputService.InputChanged:Connect(function(input)
if dragWin and input.UserInputType==Enum.UserInputType.MouseMovement then
MainWindow.Position=UDim2.new(0,input.Position.X-MainWindow.AbsoluteSize.X/2,0,input.Position.Y-MainWindow.AbsoluteSize.Y/2)
end
end)
UserInputService.InputEnded:Connect(function()dragWin=false end)

local FloatButton=ScreenGui:WaitForChild("FloatButton")
FloatButton.MouseButton1Click:Connect(function()
MainWindow.Visible=not MainWindow.Visible
if MainWindow.Visible then
MainWindow.Size=UDim2.new(0,0,0,0)
MainWindow:TweenSize(UDim2.new(0,540,0,380),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.4,true)
end
end)

end)
