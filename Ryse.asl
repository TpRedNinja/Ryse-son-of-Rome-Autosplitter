state("Ryse")
{
    string6 Area: 0x22A0517; // changes only on chapter change
    int menu: 0x02F59AA0, 0x8, 0x120, 0x648; // 0 for not menu, 1 for menu, not best address but works for now
    int xp: 0x02275DB8, 0x0, 0x20, 0x0; // total xp
    int Health: 0x02262168, 0x0, 0x0, 0x20, 0x30; // current player health
    int Combo: 0x02275DB8, 0x0, 0x90, 0x30; // current combo
    int HiddenSecrets: 0x02275DB8, 0x0, 0x100, 0x160, 0x8F8; // total Hidden Secrets
    int Vistas: 0x022952B0, 0x0, 0x110, 0x160, 0xB68; // total Vistas
    int DogTags: 0x022952B0, 0x0, 0x110, 0x160, 0x328; // total Dog Tags
    
    /*
    extra stuff need to test or may use or need to find
    
    find boss health address if people want to split on boss fights
    find a objective address to split on objectives maybe instead of chapters
    
    */
}

start
{
    if (current.menu == 0 && old.menu == 1)
    {
        return true;
    }
}

split
{
    if (current.Area == "forum/" && old.Area == "palace") //chapter 1
    {
        return true;
    } else if (current.Area == "dover/" && old.Area == "forum/") // chapter 2
    {
        return true;
    } else if (current.Area == "oswald" && old.Area == "dover/") // chapter 3
    {
        return true;
    } else if (current.Area == "glott/" && old.Area == "oswald") // chapter 4
    {
        return true;
    } else if (current.Area == "york/g" && old.Area == "glott/") //chapter 5
    {
        return true;
    } else if (current.Area == "coloss" && old.Area == "york/g") // chapter 6
    {
        return true;
    } else if (current.Area == "rome/g" && old.Area == "coloss") // chapter 7
    {
        return true;
    } else if(current.Area == "rome/g" && old.Combo > 40 && current.Combo == 0) // chapter 8 final split
    {
        return true;
    }
}

/*

area names:
palace
forum/
dover/
oswald
glott/
york/g
colosseum
rome/g

variables for keeping track of menu screens/flow
var MENU_LAUNCH:Number = 0;
var MENU_CAMPAIGN_MAIN:Number = 1;
var MENU_MULTIPLAYER_MAIN:Number = 2;
var MENU_HERO_MAIN:Number = 3;
var MENU_SOCIAL_MAIN:Number = 4;
var MENU_SELECT_DIFFICULTY: Number = 5;
var MENU_RYSE_LIVE:Number = 6;
var MENU_CAMPAIGN_TIMELINE:Number = 7;
var MENU_IN_GAME:Number = 8;
var MENU_PAUSE:Number = 9;
var MENU_SKILL_UPGRADES:Number = 10;
var MENU_SETTINGS:Number = 11;
var MENU_CAMPAIGN_COLLECTIBLES:Number = 12;
var MENU_LOADING:Number = 13;
var MENU_EXECUTIONS:Number = 14;
var MENU_MULTIPLAYER_LOBY:Number = 15;
var MENU_MULTIPLAYER_CREAT_GAME:Number = 16;
var MENU_COLLECTABLE_SCROLLS:Number = 17;
var MENU_COLLECTABLE_CONCEPT_ART:Number = 18;
var MENU_COLLECTABLE_COMIC_BOOK:Number = 19;
var MENU_COLLECTABLE_VIDEOS:Number = 20;
var MENU_COLLECTABLE_MUSIC:Number = 21;
var MENU_MULTIPLAYER_CUSTOM_MATCH:Number = 22;
var MENU_BOOSTER_PACK:Number = 23;
var MENU_CUSTOMIZE_MULTIPLAYER_GLADIATOR:Number = 24;
var MENU_LEADERBOARDS:Number = 25;
var MENU_ACHIEVEMENTS:Number = 26;

*/
