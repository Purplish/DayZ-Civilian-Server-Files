//dayZ Street Lights from axeman - axeman@thefreezer.co.uk
waitUntil {!isNull player};
//waitUntil {time > 30};
private ["_plCellsLitVar","_1stPos""_cellGen","_objLightPoint","_lightposX","_lightposY","_xpos","_ypos","_awayx","_awayy","_location","_plCurrX","_plCurrY","_nLampObject"];
_plCellsLitVar=[];
 
private["_mtrxNum","_mapSW","_mapNE","_widthX","_widthY","_cellWidth","_cellHeight"];
while {alive player}do{
axeLampReturn=[];
    if(daytime<6||daytime>17)then {
        _plCellsLitVar = player getVariable ["axeCellsLit",[]];
        //hint format ["CELLSLIT:%1",_plCellsLitVar];
        sleep 0.2;
        _plCurrX = getPos vehicle player select 0;
        _plCurrY = getPos vehicle player select 1;
        _mtrxNum = 6;
        _mapSW = [484,1546,0];
        _mapNE = [14323,13556,0];
        _widthX = (_mapNE select 0) - (_mapSW select 0);
        _widthY = (_mapNE select 1) - (_mapSW select 1);
        _cellWidth = _widthX / _mtrxNum;
        _cellHeight = _widthY / _mtrxNum;
 
        //GET CELL PLAYER IS IN - CHECK IF LIT ALREADY
        for "_x" from 0 to (_mtrxNum - 1) do {
            if(_plCurrX > (_mapSW select 0) + (_cellWidth * _x) && _plCurrX < (_mapSW select 0) + (_cellWidth * (_x+1)))then{
                for "_y" from 0 to (_mtrxNum - 1) do {
                    if(_plCurrY > (_mapSW select 1) + (_cellHeight * _y) && _plCurrY < (_mapSW select 1) + (_cellHeight * (_y+1)))then{
                        if(call Compile format ["%1%2",_x,_y] in _plCellsLitVar)then{
                        axeLampReturn=[];
                        //hint format ["IN CELL:%1%2 | ALREADY LIT:%3",_x,_y,_plCellsLitVar];
                        }else{
                        //Call Compile format ["_plCell = _cell%1%2",_x,_y];
                        axeLampObjects = [_x,_y,player];
                        publicVariable "axeLampObjects";
                        waitUntil {count axeLampReturn > 0};
                        Call Compile format ["_plCellsLitVar = _plCellsLitVar + [%1%2]",_x,_y];
                        //hint format ["IN CELL:%1%2 | NOT LIT :%3",_x,_y,_plCellsLitVar];
                        };
                    sleep 1;
                    };
                };
            };
        };
 
        if(count axeLampReturn >0)then{
            //Illuminate
            {
            _location = [_x select 0,_x select 1,_x select 2];
            _objLightPoint = nearestObject [_location, "#lightpoint"];
            _awayx=(_location select 0)-(getPos _objLightPoint select 0);
            _awayy=(_location select 1)-(getPos _objLightPoint select 1);
 
                if((_awayx>1 or _awayx<-1)or(_awayy>1 or _awayy<-1))then{
                _location set [1, (_x select 1) + ((0.6)*sin(_x select 3))];
                _location set [2,_location select 2 - 0.2];
                _location=[_location select 0, _location select 1, _location select 2];
                _lp = "#lightpoint" createVehicle _location;
                _lp setLightColor [1, 0.88, 0.73];
                _lp setLightBrightness 0.04;
                _lp setLightAmbient [1, 0.88, 0.73];
                _lp setVectorUp [0,0,-1];
                player reveal _lp;
                //hint format ["LAMP NOT FOUND:%1 | %2",_x,time];
                sleep 0.2;
                }else{
                //hint format["LAMP ALREADY FOUND | Var:%1",_objLightPoint getVariable "axeLit"];
                    if(_objLightPoint getVariable ["axeLit",0]<1)then{
                    _objLightPoint setLightColor [1, 0.88, 0.73];
                    _objLightPoint setLightBrightness 0.04;
                    _objLightPoint setLightAmbient [1, 0.88, 0.73];
                    _objLightPoint setVectorUp [0,0,-1];
                    };
                sleep 0.2;
                };
 
            }forEach axeLampReturn;
        player setVariable ["axeCellsLit",_plCellsLitVar];
        };
 
    sleep 3;
    };
};