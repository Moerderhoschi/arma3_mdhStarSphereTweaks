class CfgPatches 
{
	class mdhStarSphereTweaks
	{
		author = "Moerderhoschi";
		name = "MDH Star Sphere Tweaks";
		url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3684665929";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
		version = "1.20160815";
		versionStr = "1.20160815";
		versionAr[] = {1,20160816};
		authors[] = {};
	};
};

class CfgFunctions
{
	class mdh
	{
		class mdhFunctions
		{
			class mdhStarSphereTweaks
			{
				file = "mdhStarSphereTweaks\mdhStarSphereTweaks.sqf";
				postInit = 1;
			};
		};
	};
};

class CfgMods
{
	class mdhStarSphereTweaks
	{
		dir = "@mdhStarSphereTweaks";
		name = "MDH Star Sphere Tweaks";
		picture = "\a3\ui_f\data\IGUI\RscCustomInfo\Sensors\Targets\EnemyGround_ca.paa";
		hidePicture = "true";
		hideName = "true";
		actionName = "Website";
		action = "https://steamcommunity.com/sharedfiles/filedetails/?id=3684665929";
	};
};