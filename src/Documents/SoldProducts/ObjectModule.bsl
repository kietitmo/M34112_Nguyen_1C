
Procedure Filling(FillingData, StandardProcessing)
	//{{__CREATE_BASED_ON_WIZARD
	// This fragment was built by the wizard.
	// Warning! All manually made changes will be lost next time you use the wizard.
	If TypeOf(FillingData) = Type("DocumentRef.ImportedProducts") Then
		// Filling the headline
		For Each CurRowProducts In FillingData.Products Do
			NewRow = Products.Add();
			NewRow.Nomenclature = CurRowProducts.Nomenclature;
			NewRow.Price = CurRowProducts.Price;
			NewRow.Quantity = CurRowProducts.Quantity;
		EndDo;
	EndIf;
	//}}__CREATE_BASED_ON_WIZARD
EndProcedure

Procedure Posting(Cancel, Mode)
	//{{__REGISTER_REGISTERRECORDS_WIZARD
	// This fragment was built by the wizard.
	// Warning! All manually made changes will be lost next time you use the wizard.

	// register RemainingProducts Expense
	RegisterRecords.RemainingProducts.Write = True;
	For Each CurRowProducts In Products Do
		Record = RegisterRecords.RemainingProducts.Add();
		Record.RecordType = AccumulationRecordType.Expense;
		Record.Period = Date;
		Record.Nomenclature = CurRowProducts.Nomenclature;
		Record.Storage = Storage;
		Record.Quantity = CurRowProducts.Quantity;
		Record.Price = CurRowProducts.Price;
	EndDo;

	//}}__REGISTER_REGISTERRECORDS_WIZARD
EndProcedure
