[] spawn {
	waitUntil { !isNil "BIS_WL_arsenalSetupDone" };
    call fnc_WLArsenalFilter;
};