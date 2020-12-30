[] spawn {
	
	_uniform = uniform player;

	while {TRUE} do {

		waitUntil {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])};

		while {!isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])} do {
		
			// Remove blacklisted backpacks
			if ((backpack player) in WL_blacklist_backpacks) then {
				removeBackpack player;
			};

			// Remove blacklisted uniforms
			if ((uniform player) in WL_blacklist_uniforms) then {
				player forceAddUniform _uniform;
			};

			// Remove blacklisted headgear
			if ((headgear player) in WL_blacklist_headgear) then {
				removeHeadgear player;
			};

			// Remove blacklisted vests
			if ((vest player) in WL_blacklist_vests) then {
				removeVest player;
			};

			// Remove blacklisted magazines
			{
				if (_x in WL_blacklist_magazines) then {
					player removeMagazines _x;
				};
			} forEach magazines player;

			// Remove blacklisted weapons
			{
				if (_x in WL_blacklist_weapons) then {
					player removeWeapon _x;
				};
			} forEach weapons player;

			// Remove blacklisted primary weapon items
			{
				if (_x in WL_blacklist) then {
					player removePrimaryWeaponItem _x;
				};
			} forEach primaryWeaponItems player;

			// Remove blacklisted secondary weapon items
			{
				if (_x in WL_blacklist) then {
					player removeSecondaryWeaponItem _x;
				};
			} forEach secondaryWeaponItems player;
		
			// Remove blacklisted stored items
			{
				if (_x in WL_blacklist) then {
					player removeItem _x;
				};
			} forEach items player;

			// Remove blacklisted assigned items
			{
				if (_x in WL_blacklist) then {
					player unassignItem _x;
					player removeItem _x;
				};
			} forEach assignedItems player;

			sleep 0.01;
		};
	};
};