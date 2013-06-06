//=================================================================================
// DayZ Server Configuration by Crosire
//=================================================================================

// Enable player model check
//  CheckModel true  - Player model is checked when logging in and replaced with default if invalid
//  CheckModel false - Model check is disabled
#define CheckModel false
// Enable custom inventory
//  CheckCustInv true  - Player gets a custom loadout when specified in the database
//  CheckCustInv false - Custom inventory is not enabled
#define CheckCustInv true
// Enable object publishing check
//  CheckObject true  - Tents and objects are checked and only published to database if valid classes
//  CheckObject false - Object check is disabled and they are always published
#define CheckObject true

// Enable kill messages
//  KillMsgs true  - Kill messages are enabled and are logged down
//  KillMsgs false - Kill messages are completly disabled
#define KillMsgs true
//  KillMsgsIngame true  - Kill messages are shown ingame, requires them to be enabled
//  KillMsgsIngame false - Kills are not shown ingame
#define KillMsgsIngame true
// Enable hit messages
//  HitMsgs true  - Hit messages are enabled and are logged down
//  HitMsgs false - Hit messages are completly disabled
#define HitMsgs true
//  HitMsgsIngame true  - Hit messages are shown ingame, requires them to be enabled
//  HitMsgsIngame false - Hit messages are not shown ingame
#define HitMsgsIngame false

// Switch between old and new way of spawning
//  OldSpawn true  - Wrecks, crashsites and care packages have there own sqf files and you can change the loot inside
//  OldSpawn false - Everything is in "server_spawnWreck", wrecks randomly de-/respawn while the server is running
#define OldSpawn true

// Spawn helicopter crashsites
//  SpawnHelis true  - Helicopter crashsites are spawned
//  SpawnHelis false - No crashsites are spawned
#define SpawnHelis true
#define SpawnHelisCount 5
// Spawn random other wrecks
//  SpawnWrecks true  - Custom wrecks are spawned
//  SpawnWrecks false - No custom wrecks are spawned
#define SpawnWrecks true
#define SpawnWrecksCount 10
// Spawn care packages
//  SpawnCare true  - Care packages are spawned
//  SpawnCare false - No care packages are spawned
#define SpawnCare true
#define SpawnCareCount 5