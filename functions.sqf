fnc_WLArsenalFilter = {

    [ "Preload" ] call BIS_fnc_arsenal;

    {
        _arsenal_data = _x;

        {
            _blacklisted = _x;

            if ( { _x == _blacklisted } count _arsenal_data > 0 ) then {
                _arsenal_data = _arsenal_data - [ _blacklisted ];
            };

        } forEach WL_arsenal_filter;

        BIS_fnc_arsenal_data set [ _forEachIndex, _arsenal_data ];

    } forEach bis_fnc_arsenal_data;

};