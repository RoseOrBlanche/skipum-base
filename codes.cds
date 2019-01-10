namespace skipum.base.common;

context codes
	{
	abstract entity CodeList @cds.autoexpose {
		name: localized String(60) @title: '{i18n>codeListName}';
	}
}