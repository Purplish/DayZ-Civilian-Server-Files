if (isNil "custom_monitor") then 
{
	custom_monitor = true;
} else 
{
	custom_monitor = !custom_monitor;
};
 
while {custom_monitor} do
{
    _combattimeout = player getVariable["combattimeout",0];
	if (_combattimeout> 0) then 
	{
		_timeleft= _combattimeout - time;
		hintSilent parseText format ["
		<t size='0.90' font='Bitstream' color='#FF8000' align='left'>%1</t><t size='0.90' font='Bitstream' align='right' color='#FF8000'>%2 FPS</t><br/><br/>
		<t size='0.90' font='Bitstream' align='left'>Zombies: %9 </t><t size='0.90' font='Bitstream' align='right'>%3</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Survivors: </t><t size='0.90' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Bandits: </t><t size='0.90' font='Bitstream' align='right'>%5</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Blood: </t><t size='0.90' font='Bitstream' align='right'>%6</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Hunger: </t><t size='0.90' font='Bitstream' align='right'>%7</t><br/>
		<t size='0.90' font='Bitstream' align='left' color='#FF0000'>Speed: </t><t size='0.90' font='Bitstream' align='right' color='#FF0000'>%8</t><br/>,
		<t size='0.90' font='Bitstream' align='left' color='#FF0000'>Load: </t><t size='0.90' font='Bitstream' align='right' color='#FF0000'>%8</t><br/>",
		(name player),
		(round diag_fps),
		(player getVariable['zombieKills', 0]),
		(player getVariable['humanKills', 0]),
		(player getVariable['banditKills', 0]),
		(round r_player_blood),
		(round dayz_hunger),
		(round dayz_thirst),
		(round dayz_myLoad)];
	} else 
	{
	    hintSilent parseText format ["
		<t size='0.90' font='Bitstream' color='#FF8000' align='left'>%1</t><t size='0.90' font='Bitstream' align='right' color='#FF8000'>%2 FPS</t><br/><br/>
		<t size='0.90' font='Bitstream' align='left'>Zombies: %9 </t><t size='0.90' font='Bitstream' align='right'>%3</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Survivors: </t><t size='0.90' font='Bitstream' align='right'>%4</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Bandits: </t><t size='0.90' font='Bitstream' align='right'>%5</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Blood: </t><t size='0.90' font='Bitstream' align='right'>%6</t><br/>
		<t size='0.90' font='Bitstream' align='left'>Hunger: </t><t size='0.90' font='Bitstream' align='right'>%7</t><br/>
		<t size='0.90' font='Bitstream' align='left' color='#FF0000'>Speed: </t><t size='0.90' font='Bitstream' align='right' color='#FF0000'>%8</t><br/>,
		<t size='0.90' font='Bitstream' align='left' color='#FF0000'>Load: </t><t size='0.90' font='Bitstream' align='right' color='#FF0000'>%8</t><br/>",
		(name player),
		(round diag_fps),
		(player getVariable['zombieKills', 0]),
		(player getVariable['humanKills', 0]),
		(player getVariable['banditKills', 0]),
		(round r_player_blood),
		(round dayz_hunger),
		(round dayz_thirst),
		(round dayz_myLoad)];
	};
	sleep 1;
};