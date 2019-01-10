namespace skipum.base.common;

using skipum.base.common.codes as Codes from './codes';

context locale
{
	type Language: String(2) @(
		title: 'Language',
		description: 'Language Code',
	);
	
	type Locale: String(6) @(
		title: 'Local',
		description: 'Local'
	);
	
	entity Languages: Codes.CodeList { key code: Language; }
}