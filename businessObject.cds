namespace skipum.base.common;

using skipum.base.common.codes as Codes from './codes';

context business_object
{
	
	type User: String(255) @(
		title: 'User',
		description: 'User'
	);
	
	type DocumentNumber: String(100) @(
		title: 'Document Number',
		description: 'Document Number'
	);
	
	type SourceDocumentNumber: String(100) @(
		title: 'Source Document Number',
		description: 'Source Document Number'
	);
	
	type SourceSystem: String(3) @(
		title: 'Source System',
		description: 'Source System'
	);
	entity SourceSystems: Codes.CodeList {
		key code: SourceSystem;
	};
	
	abstract entity BusinessDocument : SourceDocument {
		document : DocumentNumber @(
			Common:
			{
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
	}	
	
	abstract entity SourceDocument : BusinessObject {
		sourceSystem : Association to SourceSystems @(
			Common:
			{
				Text: {$value: sourceSystem.name, "@UI.TextArrangement": #TextOnly},
				ValueList: {entity: 'SourceSystems', type: #fixed},
				FieldControl : #ReadOnly,
				Updatable : false,
				Creatable : true
			}
		);
		sourceDocument : SourceDocumentNumber @(
			Common:
			{
				Updatable : false,
				Creatable : true
			}
		);
	}
	
	abstract entity BusinessObject : ManagedObject {
		key ID : UUID @(
			title: 'Unique ID',
			Common.Text: {$value: name, "@UI.TextArrangement": #TextOnly}
		);
	}	
	
	abstract entity ManagedObject {
		created: {
			@( Core.Computed )
			byUser: User @(
				title: 'Created By',
				odata.on.insert: #user
			);
			at: DateTime @(
				title: 'Created At',
				odata.on.insert: #now
			);
		};
		modified: {
			@( Core.Computed )
			byUser: User @(
				title: 'Changed By',
				odata.on.update: #user
			);
			at: DateTime @(
				title: 'Changed At',
				odata: {
					on.update: #now,
					etag
				}
			);
		};
	}
}