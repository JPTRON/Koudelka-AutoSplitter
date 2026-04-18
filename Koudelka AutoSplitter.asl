// Koudelka Emulator Auto Splitter
// Made by JPTRON
state("LiveSplit") 
{
    short StepCounter  : 0x0;
}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/emu-help-v3")).CreateInstance("PS1");

	vars.Enemy1Type = vars.Helper.Make<short>(0x800afa58, 0x404);
	vars.Enemy2Type = vars.Helper.Make<short>(0x800afa5c, 0x404);
	vars.Enemy3Type = vars.Helper.Make<short>(0x800afa60, 0x404);
	vars.Enemy1HP = vars.Helper.Make<short>(0x800afa58, 0x410);
	vars.Enemy2HP = vars.Helper.Make<short>(0x800afa5c, 0x410);
	vars.Enemy3HP = vars.Helper.Make<short>(0x800afa60, 0x410);
	vars.Enemy1Alive = vars.Helper.Make<byte>(0x800afa58, 0x4f0);
	vars.Enemy2Alive = vars.Helper.Make<byte>(0x800afa5c, 0x4f0);
	vars.Enemy3Alive = vars.Helper.Make<byte>(0x800afa60, 0x4f0);

	vars.GameStarted = vars.Helper.Make<byte>(0x800a559a);
	vars.KoudelkaHP = vars.Helper.Make<short>(0x801d13c8);
	vars.EdwardHP = vars.Helper.Make<short>(0x801cf9d0);
	vars.JamesHP = vars.Helper.Make<short>(0x801cdfd8);
	vars.Room = vars.Helper.Make<short>(0x801fecfc); 
	vars.StepCounter = vars.Helper.Make<short>(0x801D11D0); 
	vars.FrameCounter = vars.Helper.Make<short>(0x800A4540); 

    vars.CompletedSplits = new bool[19];
	vars.BossAlive = false;

	vars.InBossFight = (Func<int, int, int, int, bool>)((room, enemy1Type, enemy2Type, enemy3Type) => 
	{
        return vars.Enemy1Type.Current == enemy1Type && vars.Enemy2Type.Current == enemy2Type && vars.Enemy3Type.Current == enemy3Type && vars.Room.Current == room;
    });

	vars.AllEnemiesDead = (Func<bool>)(() =>
	{
		return vars.Enemy1HP.Current == 0 && vars.Enemy2HP.Current == 0 && vars.Enemy3HP.Current == 0;
	});

	vars.AllCharactersDead = (Func<bool>)(() =>
	{
		return vars.KoudelkaHP.Current == 0 && vars.EdwardHP.Current == 0 && vars.JamesHP.Current == 0;
	});

	vars.CompleteSplit = (Func<int, bool>)((currentSplit) =>
	{
		vars.CompletedSplits[currentSplit] = true;
		return true;
	});
}

start
{
    return vars.GameStarted.Current == 1 && vars.GameStarted.Old == 0;
}

reset
{
	return vars.GameStarted.Current == 0 && vars.GameStarted.Old == 1;
}

update
{
	current.StepCounter = (short)vars.StepCounter.Current;

    print("Room: " + vars.Room.Current.ToString() + "\n" +
	"Enemy1Type: " + vars.Enemy1Type.Current.ToString() + "\n" +
	"Enemy2Type: " + vars.Enemy2Type.Current.ToString() + "\n" +
	"Enemy3Type: " + vars.Enemy3Type.Current.ToString() + "\n" +
	"Enemy1HP: " + vars.Enemy1HP.Current.ToString() + "\n" +
	"Enemy2HP: " + vars.Enemy2HP.Current.ToString() + "\n" +
	"Enemy3HP: " + vars.Enemy3HP.Current.ToString() + "\n" +
	"Enemy1Alive: " + vars.Enemy1Alive.Current.ToString() + "\n" +
	"Enemy2Alive: " + vars.Enemy2Alive.Current.ToString() + "\n" +
	"Enemy2Alive: " + vars.Enemy3Alive.Current.ToString() + "\n" +
	"KoudelkaHP: " + vars.KoudelkaHP.Current.ToString() + "\n" +
	"StepCounter: " + vars.StepCounter.Current.ToString() + "\n" +
	"FrameCounter: " + vars.FrameCounter.Current.ToString() + "\n" +
    "BossAlive: " + vars.BossAlive.ToString());
	print("_____________________");

}

split
{
	/*Werewolf*/ if(!vars.CompletedSplits[0] && vars.InBossFight(1, 0x114, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[0] = true; return true; }
	/*Yatevo*/ if(!vars.CompletedSplits[1] && vars.InBossFight(13, 0x190, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[1] = true; return true; }
	/*RGB*/ if(!vars.CompletedSplits[2] && vars.InBossFight(14, 0x197, 0x198, 0x199) && vars.AllEnemiesDead()) { vars.CompletedSplits[2] = true; return true; }
	/*Ghost Bride*/ if(!vars.CompletedSplits[3] && vars.InBossFight(17, 0x126, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[3] = true; return true; }
	/*Doppelgangers*/ if(!vars.CompletedSplits[4] && vars.InBossFight(19, 0x11d, 0x11e, 0x11f) && vars.AllEnemiesDead()) { vars.CompletedSplits[4] = true; return true; }
	/*Phantom Pirate*/ if(!vars.CompletedSplits[5] && vars.InBossFight(24, 0x11b, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[5] = true; return true; }
	/*Madonne*/ if(!vars.CompletedSplits[6] && vars.InBossFight(31, 0x191, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[6] = true; return true; }
	/*Evil Tree*/ if(!vars.CompletedSplits[7] && vars.InBossFight(37, 0x192, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[7] = true; return true; }
	/*Alias*/ if(!vars.CompletedSplits[8] && vars.InBossFight(39, 0x107, 0x12c, 0x12d) && vars.AllEnemiesDead()) { vars.CompletedSplits[8] = true; return true; }
	/*Chimera*/ if(!vars.CompletedSplits[9] && vars.InBossFight(48, 0x193, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[9] = true; return true; }
	/*Giant*/ if(!vars.CompletedSplits[10] && vars.InBossFight(64, 0x194, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[10] = true; return true; }
	/*Charlotte*/ if(!vars.CompletedSplits[11] && vars.InBossFight(22, 0x19c, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[11] = true; return true; }
	/*Jezebel*/ if(!vars.CompletedSplits[12] && vars.InBossFight(72, 0x195, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[12] = true; return true; }
	/*Apostle*/ if(!vars.CompletedSplits[13] && vars.InBossFight(83, 0x196, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[13] = true; return true; }
	/*Root 1*/ if(!vars.CompletedSplits[14] && vars.InBossFight(86, 0x19d , 0x19d, 0x19d) && vars.AllEnemiesDead()) { vars.CompletedSplits[14] = true; return true; }
	/*Root 2*/ if(!vars.CompletedSplits[15] && vars.InBossFight(87, 0x19e, 0x19d, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[15] = true; return true; }
	/*Elain 1*/ if(!vars.CompletedSplits[16] && vars.InBossFight(90, 0x19f, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[16] = true; return true; }
	/*Elain 2*/ if(!vars.CompletedSplits[17] && vars.InBossFight(91, 0x1a1, 0, 0) && vars.AllEnemiesDead()) { vars.CompletedSplits[17] = true; return true; }
	/*Elain 3*/ if(!vars.CompletedSplits[18] && vars.InBossFight(92, 0x1a0, 0, 0) && vars.AllCharactersDead()) { vars.CompletedSplits[18] = true; return true; }
}

// isLoading
// {
// 	return vars.FrameCounter.Current == vars.FrameCounter.Old;
// }