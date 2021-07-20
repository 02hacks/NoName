-- NoName [Beta]

NoName = {
	Active = true
}

function NoName.PLRLM(Args)
	local Player = game.Players:GetPlayerByUserId(string.sub(Args.Name,3))
	if NoName.Active and Player and Args:FindFirstChild("ChildrenFrame") then
		if Player.DisplayName == Args.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text then
			Args.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = Player.Name
		end
	end
end

function NoName.Func()
	for i,v in next, getgc() do
		if typeof(v) == "function" then
			for i,v2 in next, debug.getupvalues(v) do
				if typeof(v2) == "table" then
					for i,v3 in next, v2 do
						if i == "PlayerDisplayNamesEnabled" and NoName.Active then
							v2.PlayerDisplayNamesEnabled = false
							break
						end
					end
				end
			end
		end
	end
	local Scoll = game.CoreGui.PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame

	for i,v in next, Scoll.OffsetUndoFrame:GetChildren() do
		NoName.PLRLM(v)
	end
	Scoll:GetPropertyChangedSignal("CanvasPosition"):connect(function()
		for i,v in next, Scoll.OffsetUndoFrame:GetChildren() do
			NoName.PLRLM(v)
		end
	end)
end

NoName.Func()
