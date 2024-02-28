
Procedure Posting(Cancel, Mode)
	//{{__REGISTER_REGISTERRECORDS_WIZARD
	// This fragment was built by the wizard.
	// Warning! All manually made changes will be lost next time you use the wizard.

	// register RemainingProducts Receipt
	RegisterRecords.RemainingProducts.Write = True;
	For Each CurRowProducts In Products Do
		Record = RegisterRecords.RemainingProducts.Add();
		Record.RecordType = AccumulationRecordType.Receipt;
		Record.Period = Date;
		Record.Nomenclature = CurRowProducts.Nomenclature;
		Record.Storage = Storage;
		Record.Quantity = CurRowProducts.Quantity;
		Record.Price = CurRowProducts.Price;
	EndDo;

	//}}__REGISTER_REGISTERRECORDS_WIZARD
EndProcedure
