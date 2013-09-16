
private ["_positionx","_positiony","_positionz"];
_positionx = (getpos player select 0);
_positiony = (getpos player select 1);
_positionZ = (getpos player select 2);

hint format ["X = %1, y = %2, z = %3", _positionx, _positiony, _positionZ]; 