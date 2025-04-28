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

*/