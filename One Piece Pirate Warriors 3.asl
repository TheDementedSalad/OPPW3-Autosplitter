// One Piece: Pirate Warriors 3 Autosplitter Version 1.0.6 16/10/2022
// Supports IGT
// Supports autosplitting at the results screen of every level
// Splits for legend log can be obtained from https://www.speedrun.com/one_piece_pirate_warriors_3/resources
// Main script & pointers by TheDementedSalad
// Menu pointer by Nighlin

state("oppw3")
{
	int Exp: 0x49EBF0, 0x27B20;
	int MenuID: 0x4A0ED4, 0x68;
	float IGT: 0x49E934, 0x150E8, 0x0, 0x34, 0x40, 0x0, 0x10, 0xC;
}

startup
{
	vars.totalGameTime = 0;
}

update{
	if (timer.CurrentPhase == TimerPhase.NotRunning){
	vars.totalGameTime = 0;
	}
}

start
{
	return current.IGT > old.IGT && old.IGT == 0;
}

split
{
	return current.MenuID == 49 && old.MenuID != 49;
}

gameTime
{
	if(current.IGT > old.IGT){
    return TimeSpan.FromSeconds(System.Math.Floor(vars.totalGameTime + current.IGT));
    }
    if (current.IGT == 0 && old.IGT > 0){
        vars.totalGameTime = vars.totalGameTime + old.IGT;
        return TimeSpan.FromSeconds(System.Math.Floor(vars.totalGameTime + current.IGT));
	}
}

isLoading
{
	return true;
}

