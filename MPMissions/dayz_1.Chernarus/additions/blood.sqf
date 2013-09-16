//Created by Purplish, Heavily modfied by Alby
onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_jeepArray = []; //Array of the blood puddles
_recycleArray = false; //Flag to remove old puddles
_lifeSpan = 80; //_lifeSpan * 0.5 is how long a puddle will last
_debug = getMarkerpos "respawn_west";
_building1 = nearestObject [player, "Static"];
_relPos1 = _building1 worldToModel (getPosATL player);


while {!r_player_dead} do {
	if (!onLadder) then { 
	if (!dayz_isSwimming) then {	
	if (!dayz_inVehicle) then {
	
	if ((r_player_injured) && (onLadder)) then { //r_player_injured is bleeding.. i think
		_jeep = "MAP_c_autumn_flowers" createVehicle _debug;
		_jeep setPos [(getPosATL player select 0), (getPosATL player select 1), (getPosATL player select 2)];
		_jeepArray set [count _jeepArray, _jeep]; //Add new puddle to end of array
	};
	
	if (_recycleArray or {(count _jeeparray >= _lifeSpan)}) then { //Are we already removing puddles, or should we start to
		
		_remove = _jeepArray select 0; //Get first puddle in the array, the oldest one
		_jeepArray = _jeepArray - [_remove]; //Remove it from the array
		deleteVehicle _remove; //Delete the puddle
		_recycleArray = (count _jeepArray > 0); //Check if we need to keep removing puddles
		};
		};
	};
	};
		sleep 0.5;

	
};