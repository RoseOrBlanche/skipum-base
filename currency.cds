namespace skipum.base.common;

using skipum.base.common.codes as Codes from './codes';

context currency
{
	type Value: Decimal(15, 2) @(
		title: 'Amount',
		description: 'Amount'
	);
	type CurrencyCode: String(3) @(
		title: 'Currency',
		description: 'Currency Description',
	);
	entity Currency: Codes.CodeList { key code: CurrencyCode; };
	
	abstract entity Amount
	{
		amount: Value@(Measures.ISOCurrency: currency);
		currency: Currency@(
			Common: {
				Text: {$value: currency.name, "@UI.TextArrangement": #TextFirst},
				ValueList: {entity: 'Currencies', type: #fixed},
				ValueListWithFixedValues
			}
		);
	};
	}