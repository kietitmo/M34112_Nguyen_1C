&AtServerNoContext
Function ContractOnChangeAtServer(val Contract)
	Currency = Contract.Currency;
	Return Currency;
EndFunction

// Autofill currency that is determined by contract
&AtClient
Procedure ContractOnChange(Item)
	Currency = ContractOnChangeAtServer(Object.Contract);
	Object.Currency = Currency;
EndProcedure
