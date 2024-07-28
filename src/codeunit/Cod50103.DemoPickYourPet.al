codeunit 50103 "Demo Pick Your Pet"
{
    trigger OnRun()
    var
        PickPet: Page "Demo Pick Your Pet";
        AnimalType: Enum "Demo Animal Type";

    begin
        if PickPet.PickPet(AnimalType) then
            MakeSound(AnimalType);
    end;

    local procedure MakeSound(Pet: Interface "Demo IAnimal")
    begin
        Pet.MakeSound();
    end;
}
