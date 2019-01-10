namespace skipum.base.common;

using skipum.base.common.codes as Codes from './codes';

context measures
{

	type Distance: Decimal(10, 3) @(
		title: 'Distance',
		description: 'Distance',
		Measures.Unit: Units.Length
	);
	type Area: Decimal(10, 3) @(
		title: 'Area',
		description: 'Area',
		Measures.Unit: Units.Area
	);
	type Volume: Decimal(10, 3) @(
		title: 'Volume',
		description: 'Volume',
		Measures.Unit: Units.Volume
	);
	type Weight: Decimal(10, 3) @(
		title: 'Weight',
		description: 'Weight',
		Measures.Unit: Units.Weight
	);
	type Base: Decimal(10, 0) @(
		title: 'Base',
		description: 'Base',
		Measures.Unit: Units.Base
	);
	
	context Units {
		type Distance: String(3) @(
			title: 'Unit',
			description: 'Unit'
		);
		type Area: String(3) @(
			title: 'Unit',
			description: 'Unit'
		);
		type Volume: String(3) @(
			title: 'Unit',
			description: 'Unit'
		);
		type Weight: String(3) @(
			title: 'Unit',
			description: 'Unit'
		);
		type Base: String(3) @(
			title: 'Unit',
			description: 'Unit'
		);
	
		entity Distances: Codes.CodeList {
			key code: Distance;
		}
		entity Areas: Codes.CodeList {
			key code: Area;
		}
		entity Volumes: Codes.CodeList {
			key code: Volume;
		}
		entity Weights: Codes.CodeList {
			key code: Weight;
		}
		entity Bases: Codes.CodeList {
			key code: Base;
		}
	}
	context Structures
	{
		type Dimensions
		{
			length: measures.Distance @(
				title: 'Length',
				Measures.Unit: unit
			);
			width: measures.Distance @(
				title: 'Width',
				Measures.Unit: unit
			);
			height: measures.Distance @(
				title: 'Height',
				Measures.Unit: unit
			);
			unit: Association to measures.Units.Distances @(
				title: 'Distances Unit',
				Common: {
					Text: {$value: unit.name, "@UI.TextArrangement": #TextFirst},
					ValueList: {entity: 'Distances', type: #fixed},
					ValueListWithFixedValues
				}
			);
		};
		type Weight
		{
			weight: measures.Weight @Measures.Unit: unit;
			unit: Association to measures.Units.Weights @(
				title: 'Weight Unit',
				Common: {
					Text: {$value: unit.name, "@UI.TextArrangement": #TextFirst},
					ValueList: {entity: 'Weights', type: #fixed},
					ValueListWithFixedValues
				}
			);
		}
	}
}