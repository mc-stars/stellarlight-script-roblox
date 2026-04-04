local Players=game:GetService("Players")
local CoreGui=game:GetService("CoreGui")
local StarterGui=game:GetService("StarterGui")
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local Workspace=game:GetService("Workspace")
local LocalPlayer=Players.LocalPlayer

for _,v in pairs(CoreGui:GetChildren())do
if v.Name=="Stellarlight"then v:Destroy()end
end
for _,v in pairs(LocalPlayer.PlayerGui:GetChildren())do
if v.Name=="Stellarlight"then v:Destroy()end
end

local sg=Instance.new("ScreenGui")
sg.Name="Stellarlight"
sg.Parent=CoreGui
sg.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
sg.ResetOnSpawn=false

local logo=Instance.new("Frame")
logo.Size=UDim2.new(0,100,0,100)
logo.Position=UDim2.new(0.5,-50,0.5,-50)
logo.BackgroundColor3=Color3.new(0.1,0.1,0.1)
logo.Rotation=15
logo.Parent=sg

local logot=Instance.new("TextLabel")
logot.Size=UDim2.new(1,0,1,0)
logot.BackgroundTransparency=1
logot.Text="ST"
logot.TextColor3=Color3.new(1,1,1)
logot.TextScaled=true
logot.Font=Enum.Font.GothamBold
logot.Parent=logo

local tip=Instance.new("Frame")
tip.Size=UDim2.new(0,300,0,100)
tip.Position=UDim2.new(0.9,-300,0.05,0)
tip.BackgroundColor3=Color3.new(0.08,0.08,0.08)
tip.Parent=sg
local cr=Instance.new("UICorner")
cr.CornerRadius=UDim.new(0,10)
cr.Parent=tip

local text1=Instance.new("TextLabel")
text1.Size=UDim2.new(1,0,0,40)
text1.Position=UDim2.new(0,0,0,5)
text1.BackgroundTransparency=1
text1.Text="已成功启动 Stellarlight-script"
text1.TextColor3=Color3.new(1,1,1)
text1.TextScaled=true
text1.Font=Enum.Font.GothamBold
text1.Parent=tip

local text2=Instance.new("TextLabel")
text2.Size=UDim2.new(1,0,0,20)
text2.Position=UDim2.new(0,0,0,40)
text2.BackgroundTransparency=1
text2.Text="感谢您的使用"
text2.TextColor3=Color3.new(0.8,0.8,0.8)
text2.TextSize=14
text2.Parent=tip

local barback=Instance.new("Frame")
barback.Size=UDim2.new(0.9,0,0,8)
barback.Position=UDim2.new(0.05,0,0.7,0)
barback.BackgroundColor3=Color3.new(0.2,0.2,0.2)
barback.Parent=tip
local cr2=Instance.new("UICorner")
cr2.CornerRadius=UDim.new(0,4)
cr2.Parent=barback

local bar=Instance.new("Frame")
bar.Size=UDim2.new(1,0,1,0)
bar.BackgroundColor3=Color3.new(1,0,0)
bar.Parent=barback
local cr3=Instance.new("UICorner")
cr3.CornerRadius=UDim.new(0,4)
cr3.Parent=bar

TweenService:Create(logo,TweenInfo.new(1),{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
Rotation=0
}):Play()

task.wait(0.3)

for i=1,40 do
bar.Size=UDim2.new(1-(i/40),0,1,0)
task.wait(0.02)
end

tip:Destroy()
logo:Destroy()
local Float=Instance.new("Frame")
Float.Name="Float"
Float.Parent=sg
Float.Size=UDim2.new(0,70,0,70)
Float.Position=UDim2.new(0.02,0,0.04,0)
Float.BackgroundColor3=Color3.new(0.08,0.08,0.08)
Float.Rotation=15
Float.Draggable=true
Float.Active=true

local flab=Instance.new("TextLabel")
flab.Size=UDim2.new(1,0,1,0)
flab.BackgroundTransparency=1
flab.Text="ST"
flab.TextColor3=Color3.new(1,1,1)
flab.TextScaled=true
flab.Font=Enum.Font.GothamBold
flab.Parent=Float

local Main=Instance.new("Frame")
Main.Name="Main"
Main.Parent=sg
Main.Size=UDim2.new(0,600,0,420)
Main.Position=UDim2.new(0.5,-300,0.5,-210)
Main.BackgroundColor3=Color3.new(0.07,0.07,0.07)
Main.Draggable=true
Main.Active=true
Main.Visible=false

local Corner2=Instance.new("UICorner")
Corner2.CornerRadius=UDim.new(0,8)
Corner2.Parent=Main

local Top=Instance.new("Frame")
Top.Parent=Main
Top.Size=UDim2.new(1,0,0,40)
Top.BackgroundColor3=Color3.new(0.12,0.12,0.12)

local Corner3=Instance.new("UICorner")
Corner3.CornerRadius=UDim.new(0,8)
Corner3.Parent=Top

local Title=Instance.new("TextLabel")
Title.Parent=Top
Title.Size=UDim2.new(1,0,1,0)
Title.BackgroundTransparency=1
Title.Text="Stellarlight-script"
Title.TextColor3=Color3.new(1,1,1)
Title.TextScaled=true
Title.Font=Enum.Font.GothamBold

local Left=Instance.new("Frame")
Left.Parent=Main
Left.Size=UDim2.new(0.25,0,1,-40)
Left.Position=UDim2.new(0,0,0,40)
Left.BackgroundColor3=Color3.new(0.09,0.09,0.09)

local Right=Instance.new("ScrollingFrame")
Right.Parent=Main
Right.Size=UDim2.new(0.75,-10,1,-50)
Right.Position=UDim2.new(0.25,5,0,45)
Right.BackgroundTransparency=1
Right.CanvasSize=UDim2.new(0,0,8,0)
Right.ScrollBarThickness=3

local List=Instance.new("UIListLayout")
List.Parent=Right
List.Padding=UDim.new(0,6)
local function Tab(txt,callback)
local B=Instance.new("TextButton")
B.Size=UDim2.new(0.94,0,0,34)
B.Position=UDim2.new(0.03,0,0,0)
B.BackgroundColor3=Color3.new(0.14,0.14,0.14)
B.BackgroundTransparency=0
B.Text=txt
B.TextColor3=Color3.new(1,1,1)
B.Font=Enum.Font.Gotham
B.TextScaled=true
B.Parent=Left
local BC=Instance.new("UICorner")
BC.CornerRadius=UDim.new(0,6)
BC.Parent=B
B.MouseButton1Click:Connect(callback)
end

local toggles={}
local function Toggle(name,default)
local val=default
local F=Instance.new("Frame")
F.Size=UDim2.new(0.98,0,0,38)
F.BackgroundColor3=Color3.new(0.11,0.11,0.11)
F.Parent=Right
local FC=Instance.new("UICorner")
FC.CornerRadius=UDim.new(0,6)
FC.Parent=F
local L=Instance.new("TextLabel")
L.Parent=F
L.Size=UDim2.new(0.7,0,1,0)
L.Position=UDim2.new(0.04,0,0,0)
L.BackgroundTransparency=1
L.Text=name
L.TextColor3=Color3.new(1,1,1)
L.TextScaled=true
L.Font=Enum.Font.Gotham
local T=Instance.new("TextButton")
T.Parent=F
T.Size=UDim2.new(0,46,0,24)
T.Position=UDim2.new(0.92,-23,0.5,-12)
T.BackgroundColor3=val and Color3.new(0.22,0.72,0.22) or Color3.new(0.18,0.18,0.18)
local TC=Instance.new("UICorner")
TC.CornerRadius=UDim.new(1,0)
TC.Parent=T
local C=Instance.new("Frame")
C.Parent=T
C.Size=UDim2.new(0,20,0,20)
C.Position=val and UDim2.new(0.5,0,0.5,-10) or UDim2.new(0,4,0.5,-10)
C.BackgroundColor3=Color3.new(1,1,1)
local CC=Instance.new("UICorner")
CC.CornerRadius=UDim.new(1,0)
CC.Parent=C
T.MouseButton1Click:Connect(function()
val=not val
TweenService:Create(C,TweenInfo.new(0.15),{Position=val and UDim2.new(0.5,0,0.5,-10) or UDim2.new(0,4,0.5,-10)}):Play()
TweenService:Create(T,TweenInfo.new(0.15),{BackgroundColor3=val and Color3.new(0.22,0.72,0.22) or Color3.new(0.18,0.18,0.18)}):Play()
toggles[name]=val
end)
return function()return val end
end

local function ClearUI()
for _,c in pairs(Right:GetChildren())do
if c:IsA("Frame")then c:Destroy()end
end
end

Tab("玩家功能",function()
ClearUI()
Toggle("ESP 全局透视",false)
Toggle("显示名字",true)
Toggle("显示血量",true)
Toggle("显示距离",true)
Toggle("方框透视",true)
Toggle("射线透视",false)
Toggle("物品透视",false)
Toggle("飞行",false)
Toggle("超级加速",false)
Toggle("无限跳",false)
Toggle("穿墙无碰撞",false)
Toggle("浮空",false)
Toggle("防摔落伤害",false)
Toggle("自动回复",false)
Toggle("显血条",false)
end)

Tab("战斗功能",function()
ClearUI()
Toggle("自动瞄准",false)
Toggle("瞄准范围扩大",false)
Toggle("无后坐力",false)
Toggle("快速射击",false)
Toggle("远距离攻击",false)
Toggle("暴击增强",false)
Toggle("自动连击",false)
Toggle("攻击范围扩大",false)
Toggle("无视防御",false)
Toggle("攻击速度拉满",false)
end)
Tab("世界功能",function()
ClearUI()
Toggle("显宝箱",false)
Toggle("显NPC",false)
Toggle("显道具",false)
Toggle("显陷阱",false)
Toggle("显传送点",false)
Toggle("时间加速",false)
Toggle("天气控制",false)
Toggle("全图高亮",false)
Toggle("移除迷雾",false)
Toggle("全图探索",false)
end)

Tab("角色功能",function()
ClearUI()
Toggle("体型变大",false)
Toggle("体型变小",false)
Toggle("头部变大",false)
Toggle("头部变小",false)
Toggle("隐身",false)
Toggle("无敌",false)
Toggle("无限体力",false)
Toggle("无限氧气",false)
Toggle("无限弹药",false)
Toggle("无限道具",false)
end)

Tab("服务器",function()
ClearUI()
Toggle("查看所有玩家",false)
Toggle("查看背包",false)
Toggle("查看装备",false)
Toggle("查看状态",false)
Toggle("查看位置",false)
Toggle("踢出玩家",false)
Toggle("禁言玩家",false)
Toggle("服务器信息",false)
Toggle("延迟显示",false)
end)

Tab("设置",function()
ClearUI()
Toggle("UI可拖动",true)
Toggle("UI置顶",true)
Toggle("自动加载",false)
Toggle("启动提示",true)
Toggle("按键提示",true)
Toggle("暗色模式",true)
Toggle("彩虹UI",false)
Toggle("极简模式",false)
end)

local function Btn(txt,func)
local b=Instance.new("TextButton")
b.Size=UDim2.new(0.98,0,0,36)
b.BackgroundColor3=Color3.new(0.13,0.13,0.13)
b.Text=txt
b.TextColor3=Color3.new(1,1,1)
b.Font=Enum.Font.GothamBold
b.TextScaled=true
b.Parent=Right
local c=Instance.new("UICorner")
c.CornerRadius=UDim.new(0,6)
c.Parent=b
b.MouseButton1Click:Connect(func)
end

Btn("清空所有ESP",function()
for _,v in pairs(Workspace:GetDescendants())do
if v.Name=="ST_ESP"then v:Destroy()end
end
end)

Btn("关闭GUI",function()Main.Visible=false end)
Btn("重置位置",function()Main.Position=UDim2.new(0.5,-300,0.5,-210) end)
Btn("自杀",function()if LocalPlayer.Character then LocalPlayer.Character:FindFirstChild("Humanoid").Health=0 end end)

Float.MouseButton1Click:Connect(function()
Main.Visible=not Main.Visible
end)

local flyspd=60
local bv,bg

RunService.RenderStepped:Connect(function()
local char=LocalPlayer.Character
if not char then return end
local root=char:FindFirstChild("HumanoidRootPart")
local hum=char:FindFirstChild("Humanoid")
if not root or not hum then return end

if toggles["飞行"] then
hum.PlatformStand=true
if not bv then
bv=Instance.new("BodyVelocity")
bv.Parent=root
bv.MaxForce=Vector3.new(1e8,1e8,1e8)
end
if not bg then
bg=Instance.new("BodyGyro")
bg.Parent=root
bg.MaxTorque=Vector3.new(1e8,1e8,1e8)
end
bv.Velocity=Vector3.new(0,0,0)
if UserInputService:IsKeyDown(Enum.KeyCode.W)then bv.Velocity=root.CFrame.LookVector*flyspd end
if UserInputService:IsKeyDown(Enum.KeyCode.S)then bv.Velocity=-root.CFrame.LookVector*flyspd end
if UserInputService:IsKeyDown(Enum.KeyCode.A)then bv.Velocity=-root.CFrame.RightVector*flyspd end
if UserInputService:IsKeyDown(Enum.KeyCode.D)then bv.Velocity=root.CFrame.RightVector*flyspd end
if UserInputService:IsKeyDown(Enum.KeyCode.Space)then bv.Velocity=Vector3.new(0,flyspd,0)end
if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)then bv.Velocity=Vector3.new(0,-flyspd,0)end
bg.CFrame=CFrame.new(root.Position,root.Position+Workspace.CurrentCamera.CFrame.LookVector)
else
hum.PlatformStand=false
if bv then bv:Destroy()bv=nil end
if bg then bg:Destroy()bg=nil end
end

hum.WalkSpeed=toggles["超级加速"] and 32 or 16
hum.JumpPower=toggles["无限跳"] and 100 or 50

if toggles["穿墙无碰撞"] then
for _,v in pairs(char:GetDescendants())do
if v:IsA("BasePart")then v.CanCollide=false end
end
else
for _,v in pairs(char:GetDescendants())do
if v:IsA("BasePart")then v.CanCollide=true end
end
end
end)

for _,v in pairs(sg:GetDescendants())do
if v:IsA("GuiObject")then
v.Draggable=true
v.Active=true
v.ZIndex=999
end
end
