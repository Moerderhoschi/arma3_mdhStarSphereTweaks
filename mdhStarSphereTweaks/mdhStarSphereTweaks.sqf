/////////////////////////////////////////////////////////////////////////////////////////////
// MDH STAR SPEHRE TWEAKS(by Moerderhoschi) - v2026-03-25
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
					mdhStarSphereTweaksBriefingFnc =
					{
						profileNameSpace setVariable[_this#0,_this#1];
						systemChat (_this#2);
					};

					player createDiaryRecord
					[
						"MDH Mods",
						[
							_t,
							(
							'<br/>MDH Star Sphere Tweaks is a mod, created by Moerderhoschi for Arma 3. (v2026-03-25)<br/>'
							+ '<br/>'
							+ 'It fixes some bugs with the original Star Sphere Mod by POLPOX.<br/>'
							+ '- deact Star Sphere when using gear interface because of fps drops<br/>'
							+ '- deact Star Sphere when using thermal sights<br/>'
							+ '- set fixed Star Sphere value when using NVG<br/>'
							+ '- set auto Star Sphere value when using normal vision mode<br/>'
							+ '- added switch to enable/disable Star Sphere using normal vision mode<br/>'
							+ '- added switch to enable/disable Star Sphere using NVG<br/>'
							+ '- added switch to fading out Star Sphere in bad weather<br/>'
							+ '<br/>'
							+ 'MDH Star Sphere Tweaks Modoptions:'
							+ '<br/>'
							+ 'activate Star Sphere when unsig normal vision: '
							+    '<font color="#33CC33"><execute expression = "[''mdhStarSphereNormal'',1,''Star Sphere in normal vision activated''] call mdhStarSphereTweaksBriefingFnc">ON</execute></font color>'
							+ ' / <font color="#CC0000"><execute expression = "[''mdhStarSphereNormal'',0,''Star Sphere in normal vision deactivated''] call mdhStarSphereTweaksBriefingFnc">OFF</execute></font color>'
							+ '<br/>'
							+ 'activate Star Sphere when using NVG: '
							+    '<font color="#33CC33"><execute expression = "[''mdhStarSphereNVG'',1,''Star Sphere in NVG Tweak activated''] call mdhStarSphereTweaksBriefingFnc">Tweak</execute></font color>'
							+ ' / <font color="#CC0000"><execute expression = "[''mdhStarSphereNVG'',0,''Star Sphere in NVG deactivated''] call mdhStarSphereTweaksBriefingFnc">OFF</execute></font color>'
							+ ' / <font color="#33CC33"><execute expression = "[''mdhStarSphereNVG'',2,''Star Sphere in NVG standard''] call mdhStarSphereTweaksBriefingFnc">Standard</execute></font color>'
							+ '<br/>'
							+ 'fading out Star Sphere in bad weather: '
							+    '<font color="#33CC33"><execute expression = "[''mdhStarSphereFadingOut'',1,''MDH Star Sphere Tweaks Fading out activated''] call mdhStarSphereTweaksBriefingFnc">ON</execute></font color>'
							+ ' / <font color="#CC0000"><execute expression = "[''mdhStarSphereFadingOut'',0,''MDH Star Sphere Tweaks Fading out deactivated''] call mdhStarSphereTweaksBriefingFnc">OFF</execute></font color>'
							+ '<br/><br/>'							
							+ '<br/>'
							+ 'If you have any question you can contact me at the steam workshop page.<br/>'
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
					if (isNil"PLP_SSP_brightnessX") then {PLP_SSP_brightnessX = 0};
					_fog = fog;
					_overcast = overcast;
					//hintSilent (str(_fog));
					//hintSilent (str(_overcast));
					if (isnull findDisplay 602) then
					{
						if (currentVisionMode focusOn == 0) then
						{
							PLP_SSP_brightness = 0;
							_overcastB = 0;
							_fogB = 0;
							
							if (_overcast < 0.5) then {_overcastB = PLP_SSP_brightnessX * ((0.5 - _overcast) / (0.50 - 0.45))};
							if (profileNameSpace getVariable["mdhStarSphereFadingOut",1] == 0) then {_overcastB = PLP_SSP_brightnessX};
							if (profileNameSpace getVariable["mdhStarSphereNormal",1] == 0) then {_overcastB = 0};
							
							if (_fog < 0.40) then {_fogB = PLP_SSP_brightnessX * ((0.4 - _fog) / (0.4 - 0.35))};
							if (profileNameSpace getVariable["mdhStarSphereFadingOut",1] == 0) then {_fogB = PLP_SSP_brightnessX};
							if (profileNameSpace getVariable["mdhStarSphereNormal",1] == 0) then {_fogB = 0};
							
							PLP_SSP_brightness = _overcastB min _fogB;
							PLP_SSP_brightness = PLP_SSP_brightness min PLP_SSP_brightnessX;
						};

						if (currentVisionMode focusOn == 1) then
						{
							PLP_SSP_brightness = 0;
							_overcastB = 0;
							_fogB = 0;

							if (_overcast < 0.51) then {_overcastB = 14 * ((0.51 - _overcast) / (0.51 - 0.46))};
							if (profileNameSpace getVariable["mdhStarSphereFadingOut",1] == 0) then {_overcastB = 14};
							if (profileNameSpace getVariable["mdhStarSphereNVG",1] == 0) then {_overcastB = 0};
							if (profileNameSpace getVariable["mdhStarSphereNVG",1] == 2) then {_overcastB = PLP_SSP_brightnessX};

							if (_fog < 0.40) then {_fogB = 14 * ((0.4 - _fog) / (0.4 - 0.35))};
							if (profileNameSpace getVariable["mdhStarSphereFadingOut",1] == 0) then {_fogB = 14};
							if (profileNameSpace getVariable["mdhStarSphereNVG",1] == 0) then {_overcastB = 0};
							if (profileNameSpace getVariable["mdhStarSphereNVG",1] == 2) then {_overcastB = PLP_SSP_brightnessX};

							PLP_SSP_brightness = _overcastB min _fogB;
							PLP_SSP_brightness = PLP_SSP_brightness min 14;
						};

						if (currentVisionMode focusOn == 2) then {PLP_SSP_brightness = 0};
					}
					else {PLP_SSP_brightness = 0};
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
		addMissionEventHandler ["Draw3D",
		{
			if (isGamePaused) exitWith {} ;
			if (accTime == 0) exitWith {} ;
		
			_nearHouses = nearestTerrainObjects [positionCameraToWorld [0,0,0],["HOUSE","LIGHTHOUSE"],750,false,true] ;
			_coef2 = (((1.5-moonPhase date)^2) * ((getLighting#1) min 1000)^4) ;
			_coef = (((((10/_coef2)/((count _nearHouses) max 1)) max 0.1)^0.8)) ;
			_coef = (_coef/2 min 100) ;
			PLP_SSP_brightnessX = _coef;
		}];

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