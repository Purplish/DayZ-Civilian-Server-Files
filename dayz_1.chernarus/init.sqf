// Mission Initialization
startLoadingScreen ["", "RscDisplayLoadCustom"];
cutText ["", "BLACK OUT"];
enableSaving [false, false];

// Variable Initialization
dayZ_instance = 1;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

execVM "initSpec.sqf";
// Settings
player setVariable ["BIS_noCoreConversations", true]; 	// Disable greeting menu
//enableRadio false; 									// Disable global chat radio messages

// Compile and call important functions
//Load in compiled functions
//yum//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";  //YUM
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf"; //Compile regular functions         //compiles.sqf (override files) //incl headshot only
//zombie_findTargetAgent = compile preprocessFileLineNumbers "fixes\zombie_findTargetAgent.sqf";   //zombie_findTargetAgent.sqf (new AI)
//zombie_generate = compile preprocessFileLineNumbers "fixes\zombie_generate.sqf";                 //zombie_generate.sqf (create zombie)
//building_spawnZombies = compile preprocessFileLineNumbers "fixes\building_spawnZombies.sqf";     //building_spawnZombies.sqf (spawn zeds)
//control_zombieAgent = compile preprocessFileLineNumbers "fixes\control_zombieAgent.sqf";         //control_zombieAgent.sqf (zed AI - not sure this does anything)
//player_spawnCheck = compile preprocessFileLineNumbers "fixes\player_spawnCheck.sqf";             //player_spawnCheck.sqf (spawns zeds)
player_zombieCheck = compile preprocessFileLineNumbers "fixes\player_zombieCheck.sqf";           //player_zombieCheck.sqf (zombie distance target, needs work)
//player_zombieAttack = compile preprocessFileLineNumbers "fixes\player_zombieAttack.sqf";         //player_zombieAttack.sqf (zombie damage)
//zombie_findOwner = compile preprocessFileLineNumbers "fixes\zombie_findOwner.sqf";               //zombie_findOwner.sqf (serverside despawn)
//end
// end yum changes

// Set Tonemapping
"Filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4];
setToneMapping "Filmic";
playerstats = compile preprocessFileLineNumbers "debug\playerstats.sqf";
// Run the server monitor
if (isServer) then {
	dogOwner = [];
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isServer && isNull player) then {
	waitUntil { !isNull player };
	waitUntil { time > 3 };
};

if (!isServer && player != player) then {
	waitUntil { player == player };
	waitUntil { time > 3 };
};

// Run the player monitor
if (!isDedicated) then {
	[] execVM "Scripts\kh_actions.sqf";
	[] execVM "fixes\change_streetlights.sqf";
	0 fadeSound 0;
	waitUntil { !isNil "dayz_loadScreenMsg" };
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death; _nul = [] execVM "addin\plrInit.sqf";}];
	//dayZ original _id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\player_monitor.sqf";
	_nul = [] execVM "addin\plrInit.sqf";
		

};
