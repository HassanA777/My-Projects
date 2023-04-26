pageextension 60019 pExtItemReclassJournal extends "Item Reclass. Journal"
{
    layout
    {
        modify("Bin Code")
        {
            visible = true;
        }
        modify("New Bin Code")
        {
            visible = true;
        }
        moveafter("Unit of Measure Code"; "Bin Code")
        moveafter("Bin Code"; "New Bin Code")
    }
}
