
&AtClient
Procedure CommandProcessing(CommandParameter, CommandExecuteParameters)
	//{{_PRINT_WIZARD(Print)
	Spreadsheet = New SpreadsheetDocument;
	Print(Spreadsheet, CommandParameter);

	Spreadsheet.ShowGrid = False;
	Spreadsheet.Protection = True;
	Spreadsheet.ReadOnly = True;
	Spreadsheet.ShowHeaders = False;
	Spreadsheet.Show();
	//}}
EndProcedure

&AtServer
Procedure Print(Spreadsheet, CommandParameter)
	Documents.SoldProducts.Print(Spreadsheet, CommandParameter);
EndProcedure
