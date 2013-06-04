if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "player_monitor.fsm";