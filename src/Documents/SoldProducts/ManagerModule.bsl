
Procedure Print(Spreadsheet, Ref) Export
	//{{_PRINT_WIZARD(Print)
	Template = Documents.SoldProducts.GetTemplate("Print");
	Query = New Query;
	Query.Text =
	"SELECT
	|	SoldProducts.Contract,
	|	SoldProducts.Currency,
	|	SoldProducts.Date,
	|	SoldProducts.Number,
	|	SoldProducts.Products.(
	|		LineNumber,
	|		Nomenclature,
	|		Quantity,
	|		Price
	|	)
	|FROM
	|	Document.SoldProducts AS SoldProducts
	|WHERE
	|	SoldProducts.Ref IN (&Ref)";
	Query.Parameters.Insert("Ref", Ref);
	Selection = Query.Execute().Select();

	AreaCaption = Template.GetArea("Caption");
	Header = Template.GetArea("Header");
	AreaProductsHeader = Template.GetArea("ProductsHeader");
	AreaProducts = Template.GetArea("Products");
	Spreadsheet.Clear();

	InsertPageBreak = False;
	While Selection.Next() Do
		If InsertPageBreak Then
			Spreadsheet.PutHorizontalPageBreak();
		EndIf;

		Spreadsheet.Put(AreaCaption);

		Header.Parameters.Fill(Selection);
		Spreadsheet.Put(Header, Selection.Level());

		Spreadsheet.Put(AreaProductsHeader);
		SelectionProducts = Selection.Products.Select();
		While SelectionProducts.Next() Do
			AreaProducts.Parameters.Fill(SelectionProducts);
			Spreadsheet.Put(AreaProducts, SelectionProducts.Level());
		EndDo;

		InsertPageBreak = True;
	EndDo;
	//}}
EndProcedure
