/////////////////////////////////////////////////////////////////////////////////////////////
// MDH STAR SPEHRE TWEAKS(by Moerderhoschi) - v2026-03-14
// github: https://github.com/Moerderhoschi/arma3_mdhStarSphereTweaks
// steam mod version: https://steamcommunity.com/sharedfiles/filedetails/?id=3684665929
/////////////////////////////////////////////////////////////////////////////////////////////
if (missionNameSpace getVariable ["pMdhStarSphereTweaks",99] == 99) then
{
	0 spawn
	{
		_valueCheck = 99;
		_defaultValue = 99;
		_env  = hasInterface;

		_diary  = 0;
		_mdhFnc = 0;

		if (hasInterface) then
		{
			_diary =
			{
				waitUntil {!(isNull player)};
				_c = true;
				_t = "MDH Star Sphere Tweaks";
				if (player diarySubjectExists "MDH Mods") then
				{
					{
						if (_x#1 == _t) exitWith {_c = false}
					} forEach (player allDiaryRecords "MDH Mods");
				}
				else
				{
					player createDiarySubject ["MDH Mods","MDH Mods"];
				};
			
				if(_c) then
				{
					player createDiaryRecord
					[
						"MDH Mods",
						[
							_t,
							(
							'<br/>MDH Star Sphere Tweaks is a mod, created by Moerderhoschi for Arma 3. (v2026-03-14)<br/>'
							+ '<br/>'
							+ 'It fixes some bugs with the original Star Sphere Mod by POLPOX.<br/>'
							+ '- deact Star Sphere when using gear interface because of fps drops<br/>'
							+ '- deact Star Sphere when using themal sights<br/>'
							+ '- set fixed Star Sphere value when using NVG<br/>'
							+ '- set auto Star Sphere value when using normal vision mode<br/>'
							+ '<br/>'
							+ 'If you have any question you can contact me at the steam workshop page.<br/>'
							+ '<br/>'
							+ '<br/>'
							+ 'Credits and Thanks:<br/>'
							+ 'Armed-Assault.de Crew - For many great ArmA moments in many years<br/>'
							+ 'BIS - For ArmA3<br/>'
							)
						]
					]
				};
				true
			};
		};

		if (_env) then
		{
			_mdhFnc =
			{
				for "_i2" from 1 to 10 do
				{
					if (isNil"PLP_SSP_brightnessMode") then {PLP_SSP_brightnessMode = 0};
					if (isnull findDisplay 602) then
					{
						if (currentVisionMode focusOn == 0 && {PLP_SSP_brightnessMode != 0}) then {PLP_SSP_brightness = -1; PLP_SSP_brightnessMode = 0};
						if (currentVisionMode focusOn == 1 && {PLP_SSP_brightnessMode != 1}) then {PLP_SSP_brightness = 14; PLP_SSP_brightnessMode = 1};
						if (currentVisionMode focusOn == 2 && {PLP_SSP_brightnessMode != 2}) then {PLP_SSP_brightness =  0; PLP_SSP_brightnessMode = 2};
					}
					else
					{
						PLP_SSP_brightness = 0; PLP_SSP_brightnessMode = 9;
					};
					sleep 0.1;
				};
			};
		};

		if (hasInterface) then
		{
			if (isNil"mdhModDiaryEntries")then{mdhModDiaryEntries=[]; mdhModDiaryEntriesAdd = 1};
			mdhModDiaryEntries pushBack ["mdhStarSphereTweaks",_diary];
			uiSleep (2 + random 1);
			if (mdhModDiaryEntriesAdd == 1) then
			{
				mdhModDiaryEntriesAdd = 0;
				mdhModDiaryEntries sort false;
				{call (_x#1)} forEach mdhModDiaryEntries;
			};
		};

		sleep (1 + random 1);
		while {missionNameSpace getVariable ["pMdhStarSphereTweaks",_defaultValue] == _valueCheck} do
		{
			if (_env) then
			{
				for "_i" from 1 to 6 do
				{
					call _mdhFnc;
				};
			};
			if (hasInterface) then {{call (_x#1)} forEach mdhModDiaryEntries};
		};
	};
};