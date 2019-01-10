namespace skipum.base.common;

using skipum.base.common.codes as Codes from './codes';

context geographic
{
	type Country: String(3) @(
		title: 'Country',
		description: 'Country',
	);
	entity Countries: Codes.CodeList {
		key code: Country;
	}
	
	type Region: String(3) @(
		title: 'Region',
		description: 'Region',
	);
	entity Regions: Codes.CodeList {
		key code: Region;	
		key country :  Association to geographic.Countries	@(
			Common: {
				Text: {$value: country.name, "@UI.TextArrangement": #TextFirst},
				ValueList: {entity: 'Countries', type: #fixed},
				ValueListWithFixedValues
			}
		);
	}
}