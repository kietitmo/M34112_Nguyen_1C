&AtClient
Procedure ProductNomenclatureOnChange(Item)
	line = Items.Products.CurrentData; 
	line.Price = ProductNomenclatureOnChangeAtServer(line.Nomenclature);
EndProcedure

&AtServer
Function ProductNomenclatureOnChangeAtServer(Val Nomenclature)
	StructureNomen = new Structure("Nomenclature", Nomenclature);
	res = InformationRegisters.NomenclaturePrice.GetLast(CurrentDate(), StructureNomen);
	Return res.Price;
EndFunction    