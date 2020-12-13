include "share/fb303/if/fb303.thrift" 

namespace java org.apache.hadoop.hive.metastore.api 
namespace php metastore 
namespace cpp Apache.Hadoop.Hive 

const i8 ACCESSTYPE_READONLY = 2 
const string HIVE_FILTER_FIELD_LAST_ACCESS = %!d(string=hive_filter_field_last_access__) 
const string IS_ARCHIVED = %!d(string=is_archived) 
const string META_TABLE_COLUMN_TYPES = %!d(string=columns.types) 
const i8 ACCESSTYPE_READWRITE = 8 
const string IS_IMMUTABLE = %!d(string=immutable) 
const string META_TABLE_COLUMNS = %!d(string=columns) 
const string BUCKET_FIELD_NAME = %!d(string=bucket_field_name) 
const string TABLE_IS_TRANSACTIONAL = %!d(string=transactional) 
const string ORIGINAL_LOCATION = %!d(string=original_location) 
const string META_TABLE_DB = %!d(string=db) 
const string META_TABLE_SERDE = %!d(string=serde) 
const string META_TABLE_PARTITION_COLUMNS = %!d(string=partition_columns) 
const string FILE_OUTPUT_FORMAT = %!d(string=file.outputformat) 
const string META_TABLE_STORAGE = %!d(string=storage_handler) 
const string DDL_TIME = %!d(string=transient_lastDdlTime) 
const string FILE_INPUT_FORMAT = %!d(string=file.inputformat) 
const string TABLE_TRANSACTIONAL_PROPERTIES = %!d(string=transactional_properties) 
const string FIELD_TO_DIMENSION = %!d(string=field_to_dimension) 
const string META_TABLE_PARTITION_COLUMN_TYPES = %!d(string=partition_columns.types) 
const string JDBC_CONFIG_PREFIX = %!d(string=hive.sql.) 
const i8 ACCESSTYPE_NONE = 1 
const string META_TABLE_NAME = %!d(string=name) 
const string HIVE_FILTER_FIELD_OWNER = %!d(string=hive_filter_field_owner__) 
const string META_TABLE_LOCATION = %!d(string=location) 
const string TABLE_BUCKETING_VERSION = %!d(string=bucketing_version) 
const i8 ACCESSTYPE_WRITEONLY = 4 
const string HIVE_FILTER_FIELD_PARAMS = %!d(string=hive_filter_field_params__) 
const string BUCKET_COUNT = %!d(string=bucket_count) 
const string TABLE_NO_AUTO_COMPACT = %!d(string=no_auto_compaction) 
const string DRUID_CONFIG_PREFIX = %!d(string=druid.) 

struct Role { 
	1: required string roleName 
	2: required i32 createTime 
	3: required string ownerName 
} 

struct TableStatsRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required list<string> colNames 
	4: optional string catName 
	5: optional string validWriteIdList 
	6: required string engine 
	7: optional i64 id 
} 

struct WriteEventInfo { 
	1: required i64 writeId 
	2: required string database 
	3: required string table 
	4: required string files 
	5: optional string partition 
	6: optional string tableObj 
	7: optional string partitionObj 
} 

struct ScheduledQueryProgressInfo { 
	1: required i64 scheduledExecutionId 
	2: required QueryState state 
	3: required string executorQueryId 
	4: optional string errorMessage 
} 

struct GetOpenTxnsRequest { 
	1: optional list<TxnType> excludeTxnTypes 
} 

struct SQLNotNullConstraint { 
	1: required string catName 
	2: required string table_db 
	3: required string table_name 
	4: required string column_name 
	5: required string nn_name 
	6: required bool enable_cstr 
	7: required bool validate_cstr 
	8: required bool rely_cstr 
} 

struct BooleanColumnStatsData { 
	1: required i64 numTrues 
	2: required i64 numFalses 
	3: required i64 numNulls 
	4: optional binary bitVectors 
} 

struct ColumnStatistics { 
	1: required ColumnStatisticsDesc statsDesc 
	2: required list<ColumnStatisticsObj> statsObj 
	3: optional bool isStatsCompliant 
	4: optional string engine 
} 

struct PartitionListComposingSpec { 
	1: required list<Partition> partitions 
} 

struct NotNullConstraintsRequest { 
	1: required string catName 
	2: required string db_name 
	3: required string tbl_name 
} 

struct CompactionInfoStruct { 
	1: required i64 id 
	2: required string dbname 
	3: required string tablename 
	4: optional string partitionname 
	5: required CompactionType type 
	6: optional string runas 
	7: optional string properties 
	8: optional bool toomanyaborts 
	9: optional string state 
	10: optional string workerId 
	11: optional i64 start 
	12: optional i64 highestWriteId 
	13: optional string errorMessage 
	14: optional bool hasoldabort 
	15: optional i64 enqueueTime 
} 

struct ShowCompactResponseElement { 
	1: required string dbname 
	2: required string tablename 
	3: optional string partitionname 
	4: required CompactionType type 
	5: required string state 
	6: optional string workerid 
	7: optional i64 start 
	8: optional string runAs 
	9: optional i64 hightestTxnId 
	10: optional string metaInfo 
	11: optional i64 endTime 
	12: optional string hadoopJobId 
	13: optional i64 id 
	14: optional string errorMessage 
	15: optional i64 enqueueTime 
} 

struct PartitionValuesRow { 
	1: required list<string> row 
} 

struct AbortTxnRequest { 
	1: required i64 txnid 
	2: optional string replPolicy 
} 

struct CommitTxnRequest { 
	1: required i64 txnid 
	2: optional string replPolicy 
	3: optional list<WriteEventInfo> writeEventInfos 
	4: optional ReplLastIdInfo replLastIdInfo 
	5: optional CommitTxnKeyValue keyValue 
	6: optional bool exclWriteEnabled 
} 

struct WMGetAllResourcePlanRequest { 
	1: optional string ns 
} 

struct WMCreateOrUpdateMappingRequest { 
	1: optional WMMapping mapping 
	2: optional bool update 
} 

struct FieldSchema { 
	1: required string name 
	2: required string type 
	3: required string comment 
} 

struct GetRoleGrantsForPrincipalResponse { 
	1: required list<RolePrincipalGrant> principalGrants 
} 

struct SetPartitionsStatsResponse { 
	1: required bool result 
} 

struct DefaultConstraintsRequest { 
	1: required string catName 
	2: required string db_name 
	3: required string tbl_name 
} 

struct TruncateTableRequest { 
	1: required string dbName 
	2: required string tableName 
	3: optional list<string> partNames 
	4: optional i64 writeId 
	5: optional string validWriteIdList 
} 

struct AddPrimaryKeyRequest { 
	1: required list<SQLPrimaryKey> primaryKeyCols 
} 

struct WMAlterPoolResponse { 
} 

struct GetReplicationMetricsRequest { 
	1: optional i64 scheduledExecutionId 
	2: optional string policy 
	3: optional i64 dumpExecutionId 
} 

struct Table { 
	1: required string tableName 
	2: required string dbName 
	3: required string owner 
	4: required i32 createTime 
	5: required i32 lastAccessTime 
	6: required i32 retention 
	7: required StorageDescriptor sd 
	8: required list<FieldSchema> partitionKeys 
	9: required map<string,string> parameters 
	10: required string viewOriginalText 
	11: required string viewExpandedText 
	12: required string tableType 
	13: optional PrincipalPrivilegeSet privileges 
	14: optional bool temporary 
	15: optional bool rewriteEnabled 
	16: optional CreationMetadata creationMetadata 
	17: optional string catName 
	18: optional PrincipalType ownerType 
	19: optional i64 writeId 
	20: optional bool isStatsCompliant 
	21: optional ColumnStatistics colStats 
	22: optional i8 accessType 
	23: optional list<string> requiredReadCapabilities 
	24: optional list<string> requiredWriteCapabilities 
	25: optional i64 id 
} 

struct PartitionsByExprResult { 
	1: required list<Partition> partitions 
	2: required bool hasUnknownPartitions 
} 

struct GetPartitionsPsWithAuthResponse { 
	1: required list<Partition> partitions 
} 

struct SQLAllTableConstraints { 
	1: optional list<SQLPrimaryKey> primaryKeys 
	2: optional list<SQLForeignKey> foreignKeys 
	3: optional list<SQLUniqueConstraint> uniqueConstraints 
	4: optional list<SQLNotNullConstraint> notNullConstraints 
	5: optional list<SQLDefaultConstraint> defaultConstraints 
	6: optional list<SQLCheckConstraint> checkConstraints 
} 

struct HiveObjectRef { 
	1: required HiveObjectType objectType 
	2: required string dbName 
	3: required string objectName 
	4: required list<string> partValues 
	5: required string columnName 
	6: optional string catName 
} 

struct WMDropMappingResponse { 
} 

struct PartitionSpecWithSharedSD { 
	1: required list<PartitionWithoutSD> partitions 
	2: required StorageDescriptor sd 
} 

struct SeedTableWriteIdsRequest { 
	1: required string dbName 
	2: required string tableName 
	3: required i64 seedWriteId 
} 

struct HiveObjectPrivilege { 
	1: required HiveObjectRef hiveObject 
	2: required string principalName 
	3: required PrincipalType principalType 
	4: required PrivilegeGrantInfo grantInfo 
	5: required string authorizer 
} 

struct ReplLastIdInfo { 
	1: required string database 
	2: required i64 lastReplId 
	3: optional string table 
	4: optional string catalog 
	5: optional list<string> partitionList 
} 

struct WMMapping { 
	1: required string resourcePlanName 
	2: required string entityType 
	3: required string entityName 
	4: optional string poolPath 
	5: optional i32 ordering 
	6: optional string ns 
} 

struct ScheduledQueryPollRequest { 
	1: required string clusterNamespace 
} 

struct Catalog { 
	1: required string name 
	2: optional string description 
	3: required string locationUri 
	4: optional i32 createTime 
} 

struct WMCreateResourcePlanResponse { 
} 

struct WMGetActiveResourcePlanRequest { 
	1: optional string ns 
} 

struct GetFieldsRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional EnvironmentContext envContext 
	5: optional string validWriteIdList 
	6: optional i64 id 
} 

struct WMGetResourcePlanResponse { 
	1: optional WMFullResourcePlan resourcePlan 
} 

struct WMAlterResourcePlanRequest { 
	1: optional string resourcePlanName 
	2: optional WMNullableResourcePlan resourcePlan 
	3: optional bool isEnableAndActivate 
	4: optional bool isForceDeactivate 
	5: optional bool isReplace 
	6: optional string ns 
} 

struct CheckLockRequest { 
	1: required i64 lockid 
	2: optional i64 txnid 
	3: optional i64 elapsed_ms 
} 

struct Date { 
	1: required i64 daysSinceEpoch 
} 

struct PrimaryKeysRequest { 
	1: required string db_name 
	2: required string tbl_name 
	3: optional string catName 
} 

struct AddUniqueConstraintRequest { 
	1: required list<SQLUniqueConstraint> uniqueConstraintCols 
} 

struct PartitionValuesResponse { 
	1: required list<PartitionValuesRow> partitionValues 
} 

struct AbortTxnsRequest { 
	1: required list<i64> txn_ids 
} 

struct AlterPartitionsRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tableName 
	4: required list<Partition> partitions 
	5: optional EnvironmentContext environmentContext 
	6: optional i64 writeId 
	7: optional string validWriteIdList 
} 

struct StoredProcedureRequest { 
	1: required string catName 
	2: required string dbName 
	3: required string procName 
} 

struct ShowLocksRequest { 
	1: optional string dbname 
	2: optional string tablename 
	3: optional string partname 
	4: optional bool isExtended 
	5: optional i64 txnid 
} 

struct ShowLocksResponseElement { 
	1: required i64 lockid 
	2: required string dbname 
	3: optional string tablename 
	4: optional string partname 
	5: required LockState state 
	6: required LockType type 
	7: optional i64 txnid 
	8: required i64 lastheartbeat 
	9: optional i64 acquiredat 
	10: required string user 
	11: required string hostname 
	12: optional i32 heartbeatCount 
	13: optional string agentInfo 
	14: optional i64 blockedByExtId 
	15: optional i64 blockedByIntId 
	16: optional i64 lockIdInternal 
} 

struct ResourceUri { 
	1: required ResourceType resourceType 
	2: required string uri 
} 

struct WMTrigger { 
	1: required string resourcePlanName 
	2: required string triggerName 
	3: optional string triggerExpression 
	4: optional string actionExpression 
	5: optional bool isInUnmanaged 
	6: optional string ns 
} 

struct CreateTableRequest { 
	1: required Table table 
	2: optional EnvironmentContext envContext 
	3: optional list<SQLPrimaryKey> primaryKeys 
	4: optional list<SQLForeignKey> foreignKeys 
	5: optional list<SQLUniqueConstraint> uniqueConstraints 
	6: optional list<SQLNotNullConstraint> notNullConstraints 
	7: optional list<SQLDefaultConstraint> defaultConstraints 
	8: optional list<SQLCheckConstraint> checkConstraints 
	9: optional list<string> processorCapabilities 
	10: optional string processorIdentifier 
} 

struct AddPartitionsRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required list<Partition> parts 
	4: required bool ifNotExists 
	5: optional bool needResult 
	6: optional string catName 
	7: optional string validWriteIdList 
} 

struct WMDropTriggerRequest { 
	1: optional string resourcePlanName 
	2: optional string triggerName 
	3: optional string ns 
} 

struct WMGetTriggersForResourePlanResponse { 
	1: optional list<WMTrigger> triggers 
} 

struct MapSchemaVersionToSerdeRequest { 
	1: required SchemaVersionDescriptor schemaVersion 
	2: required string serdeName 
} 

struct FindSchemasByColsRqst { 
	1: optional string colName 
	2: optional string colNamespace 
	3: optional string type 
} 

struct GetPartitionNamesPsResponse { 
	1: required list<string> names 
} 

struct OpenTxnsResponse { 
	1: required list<i64> txn_ids 
} 

struct NotificationEventsCountRequest { 
	1: required i64 fromEventId 
	2: required string dbName 
	3: optional string catName 
	4: optional i64 toEventId 
	5: optional i64 limit 
} 

struct GetFileMetadataResult { 
	1: required map<i64,binary> metadata 
	2: required bool isSupported 
} 

struct WMAlterResourcePlanResponse { 
	1: optional WMFullResourcePlan fullResourcePlan 
} 

struct ColumnStatisticsObj { 
	1: required string colName 
	2: required string colType 
	3: required ColumnStatisticsData statsData 
} 

struct WMDropTriggerResponse { 
} 

struct SeedTxnIdRequest { 
	1: required i64 seedTxnId 
} 

struct WMCreatePoolResponse { 
} 

struct SkewedInfo { 
	1: required list<string> skewedColNames 
	2: required list<list<string>> skewedColValues 
	3: required map<list<string>,string> skewedColValueLocationMaps 
} 

struct DoubleColumnStatsData { 
	1: optional double lowValue 
	2: optional double highValue 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct DropPartitionsRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required RequestPartsSpec parts 
	4: optional bool deleteData 
	5: optional bool ifExists 
	6: optional bool ignoreProtection 
	7: optional EnvironmentContext environmentContext 
	8: optional bool needResult 
	9: optional string catName 
} 

struct PartitionValuesRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required list<FieldSchema> partitionKeys 
	4: optional bool applyDistinct 
	5: optional string filter 
	6: optional list<FieldSchema> partitionOrder 
	7: optional bool ascending 
	8: optional i64 maxParts 
	9: optional string catName 
	10: optional string validWriteIdList 
} 

struct WMCreateOrDropTriggerToPoolMappingRequest { 
	1: optional string resourcePlanName 
	2: optional string triggerName 
	3: optional string poolPath 
	4: optional bool drop 
	5: optional string ns 
} 

struct PartitionsRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional i16 maxParts 
	5: optional string validWriteIdList 
	6: optional i64 id 
} 

struct PartitionsResponse { 
	1: required list<Partition> partitions 
} 

struct SerDeInfo { 
	1: required string name 
	2: required string serializationLib 
	3: required map<string,string> parameters 
	4: optional string description 
	5: optional string serializerClass 
	6: optional string deserializerClass 
	7: optional SerdeType serdeType 
} 

struct AllTableConstraintsRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required string catName 
} 

struct ClearFileMetadataResult { 
} 

struct GetTablesResult { 
	1: required list<Table> tables 
} 

struct HeartbeatRequest { 
	1: optional i64 lockid 
	2: optional i64 txnid 
} 

struct CompactionRequest { 
	1: required string dbname 
	2: required string tablename 
	3: optional string partitionname 
	4: required CompactionType type 
	5: optional string runas 
	6: optional map<string,string> properties 
} 

struct PartitionSpec { 
	1: required string dbName 
	2: required string tableName 
	3: required string rootPath 
	4: optional PartitionSpecWithSharedSD sharedSDPartitionSpec 
	5: optional PartitionListComposingSpec partitionList 
	6: optional string catName 
	7: optional i64 writeId 
	8: optional bool isStatsCompliant 
} 

struct ForeignKeysRequest { 
	1: required string parent_db_name 
	2: required string parent_tbl_name 
	3: required string foreign_db_name 
	4: required string foreign_tbl_name 
	5: optional string catName 
} 

struct ReplTblWriteIdStateRequest { 
	1: required string validWriteIdlist 
	2: required string user 
	3: required string hostName 
	4: required string dbName 
	5: required string tableName 
	6: optional list<string> partNames 
} 

struct TableValidWriteIds { 
	1: required string fullTableName 
	2: required i64 writeIdHighWaterMark 
	3: required list<i64> invalidWriteIds 
	4: optional i64 minOpenWriteId 
	5: required binary abortedBits 
} 

struct PutFileMetadataRequest { 
	1: required list<i64> fileIds 
	2: required list<binary> metadata 
	3: optional FileMetadataExprType type 
} 

struct ScheduledQueryKey { 
	1: required string scheduleName 
	2: required string clusterNamespace 
} 

struct ScheduledQueryMaintenanceRequest { 
	1: required ScheduledQueryMaintenanceRequestType type 
	2: required ScheduledQuery scheduledQuery 
} 

struct SQLDefaultConstraint { 
	1: required string catName 
	2: required string table_db 
	3: required string table_name 
	4: required string column_name 
	5: required string default_value 
	6: required string dc_name 
	7: required bool enable_cstr 
	8: required bool validate_cstr 
	9: required bool rely_cstr 
} 

struct ColumnStatisticsDesc { 
	1: required bool isTblLevel 
	2: required string dbName 
	3: required string tableName 
	4: optional string partName 
	5: optional i64 lastAnalyzed 
	6: optional string catName 
} 

struct TxnInfo { 
	1: required i64 id 
	2: required TxnState state 
	3: required string user 
	4: required string hostname 
	5: optional string agentInfo 
	6: optional i32 heartbeatCount 
	7: optional string metaInfo 
	8: optional i64 startedTime 
	9: optional i64 lastHeartbeatTime 
} 

struct GetOpenTxnsInfoResponse { 
	1: required i64 txn_high_water_mark 
	2: required list<TxnInfo> open_txns 
} 

struct DropConstraintRequest { 
	1: required string dbname 
	2: required string tablename 
	3: required string constraintname 
	4: optional string catName 
} 

struct OpenTxnRequest { 
	1: required i32 num_txns 
	2: required string user 
	3: required string hostname 
	4: optional string agentInfo 
	5: optional string replPolicy 
	6: optional list<i64> replSrcTxnIds 
	7: optional TxnType txn_type 
} 

struct CommitTxnKeyValue { 
	1: required i64 tableId 
	2: required string key 
	3: required string value 
} 

struct FireEventResponse { 
	1: required list<i64> eventIds 
} 

struct CreateCatalogRequest { 
	1: required Catalog catalog 
} 

struct GetCatalogsResponse { 
	1: required list<string> names 
} 

struct DecimalColumnStatsData { 
	1: optional Decimal lowValue 
	2: optional Decimal highValue 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct AllTableConstraintsResponse { 
	1: required SQLAllTableConstraints allTableConstraints 
} 

struct Index { 
	1: required string indexName 
	2: required string indexHandlerClass 
	3: required string dbName 
	4: required string origTableName 
	5: required i32 createTime 
	6: required i32 lastAccessTime 
	7: required string indexTableName 
	8: required StorageDescriptor sd 
	9: required map<string,string> parameters 
	10: required bool deferredRebuild 
} 

struct CacheFileMetadataRequest { 
	1: required string dbName 
	2: required string tblName 
	3: optional string partName 
	4: optional bool isAllParts 
} 

struct WMGetActiveResourcePlanResponse { 
	1: optional WMFullResourcePlan resourcePlan 
} 

struct ScheduledQueryPollResponse { 
	1: optional ScheduledQueryKey scheduleKey 
	2: optional i64 executionId 
	3: optional string query 
	4: optional string user 
} 

struct ReplicationMetrics { 
	1: required i64 scheduledExecutionId 
	2: required string policy 
	3: required i64 dumpExecutionId 
	4: optional string metadata 
	5: optional string progress 
} 

struct FindSchemasByColsResp { 
	1: required list<SchemaVersionDescriptor> schemaVersions 
} 

struct ReplicationMetricList { 
	1: required list<ReplicationMetrics> replicationMetricList 
} 

struct Timestamp { 
	1: required i64 secondsSinceEpoch 
} 

struct MaxAllocatedTableWriteIdRequest { 
	1: required string dbName 
	2: required string tableName 
} 

struct AddDynamicPartitions { 
	1: required i64 txnid 
	2: required i64 writeid 
	3: required string dbname 
	4: required string tablename 
	5: required list<string> partitionnames 
	6: optional DataOperationType operationType 
} 

struct WMDropResourcePlanResponse { 
} 

struct GrantRevokeRoleRequest { 
	1: required GrantRevokeType requestType 
	2: required string roleName 
	3: required string principalName 
	4: required PrincipalType principalType 
	5: optional string grantor 
	6: optional PrincipalType grantorType 
	7: optional bool grantOption 
} 

struct AddPartitionsResult { 
	1: optional list<Partition> partitions 
	2: optional bool isStatsCompliant 
} 

struct WMDropPoolRequest { 
	1: optional string resourcePlanName 
	2: optional string poolPath 
	3: optional string ns 
} 

struct GetSchemaResponse { 
	1: required list<FieldSchema> fields 
} 

struct StorageDescriptor { 
	1: required list<FieldSchema> cols 
	2: required string location 
	3: required string inputFormat 
	4: required string outputFormat 
	5: required bool compressed 
	6: required i32 numBuckets 
	7: required SerDeInfo serdeInfo 
	8: required list<string> bucketCols 
	9: required list<Order> sortCols 
	10: required map<string,string> parameters 
	11: optional SkewedInfo skewedInfo 
	12: optional bool storedAsSubDirectories 
} 

struct SetPartitionsStatsRequest { 
	1: required list<ColumnStatistics> colStats 
	2: optional bool needMerge 
	3: optional i64 writeId 
	4: optional string validWriteIdList 
	5: required string engine 
} 

struct PartitionsSpecByExprResult { 
	1: required list<PartitionSpec> partitionsSpec 
	2: required bool hasUnknownPartitions 
} 

struct GetOpenTxnsResponse { 
	1: required i64 txn_high_water_mark 
	2: required list<i64> open_txns 
	3: optional i64 min_open_txn 
	4: required binary abortedBits 
} 

struct Type { 
	1: required string name 
	2: optional string type1 
	3: optional string type2 
	4: optional list<FieldSchema> fields 
} 

struct PrincipalPrivilegeSet { 
	1: required map<string,list<PrivilegeGrantInfo>> userPrivileges 
	2: required map<string,list<PrivilegeGrantInfo>> groupPrivileges 
	3: required map<string,list<PrivilegeGrantInfo>> rolePrivileges 
} 

struct GetPrincipalsInRoleResponse { 
	1: required list<RolePrincipalGrant> principalGrants 
} 

struct AlterCatalogRequest { 
	1: required string name 
	2: required Catalog newCat 
} 

struct WMDropPoolResponse { 
} 

struct GetPrincipalsInRoleRequest { 
	1: required string roleName 
} 

struct StringColumnStatsData { 
	1: required i64 maxColLen 
	2: required double avgColLen 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct NotNullConstraintsResponse { 
	1: required list<SQLNotNullConstraint> notNullConstraints 
} 

struct ExtendedTableInfo { 
	1: required string tblName 
	2: optional i32 accessType 
	3: optional list<string> requiredReadCapabilities 
	4: optional list<string> requiredWriteCapabilities 
} 

struct ISchema { 
	1: required SchemaType schemaType 
	2: required string name 
	3: required string catName 
	4: required string dbName 
	5: required SchemaCompatibility compatibility 
	6: required SchemaValidation validationLevel 
	7: required bool canEvolve 
	8: optional string schemaGroup 
	9: optional string description 
} 

struct SchemaVersion { 
	1: required ISchemaName schema 
	2: required i32 version 
	3: required i64 createdAt 
	4: required list<FieldSchema> cols 
	5: optional SchemaVersionState state 
	6: optional string description 
	7: optional string schemaText 
	8: optional string fingerprint 
	9: optional string name 
	10: optional SerDeInfo serDe 
} 

struct RuntimeStat { 
	1: optional i32 createTime 
	2: required i32 weight 
	3: required binary payload 
} 

struct Partition { 
	1: required list<string> values 
	2: required string dbName 
	3: required string tableName 
	4: required i32 createTime 
	5: required i32 lastAccessTime 
	6: required StorageDescriptor sd 
	7: required map<string,string> parameters 
	8: optional PrincipalPrivilegeSet privileges 
	9: optional string catName 
	10: optional i64 writeId 
	11: optional bool isStatsCompliant 
	12: optional ColumnStatistics colStats 
} 

struct GetPartitionsByNamesResult { 
	1: required list<Partition> partitions 
} 

struct WMPoolTrigger { 
	1: required string pool 
	2: required string trigger 
	3: optional string ns 
} 

struct WMAlterTriggerResponse { 
} 

struct WMValidateResourcePlanResponse { 
	1: optional list<string> errors 
	2: optional list<string> warnings 
} 

struct DefaultConstraintsResponse { 
	1: required list<SQLDefaultConstraint> defaultConstraints 
} 

struct AddForeignKeyRequest { 
	1: required list<SQLForeignKey> foreignKeyCols 
} 

struct GetPartitionsByNamesRequest { 
	1: required string db_name 
	2: required string tbl_name 
	3: optional list<string> names 
	4: optional bool get_col_stats 
	5: optional list<string> processorCapabilities 
	6: optional string processorIdentifier 
	7: optional string engine 
	8: optional string validWriteIdList 
} 

struct TableMeta { 
	1: required string dbName 
	2: required string tableName 
	3: required string tableType 
	4: optional string comments 
	5: optional string catName 
} 

struct GetSerdeRequest { 
	1: required string serdeName 
} 

struct GetCatalogRequest { 
	1: required string name 
} 

struct UniqueConstraintsRequest { 
	1: required string catName 
	2: required string db_name 
	3: required string tbl_name 
} 

struct ISchemaName { 
	1: required string catName 
	2: required string dbName 
	3: required string schemaName 
} 

struct GetPartitionsResponse { 
	1: required list<PartitionSpec> partitionSpec 
} 

struct RenamePartitionResponse { 
} 

struct AggrStats { 
	1: required list<ColumnStatisticsObj> colStats 
	2: required i64 partsFound 
	3: optional bool isStatsCompliant 
} 

struct GetFileMetadataRequest { 
	1: required list<i64> fileIds 
} 

struct PutFileMetadataResult { 
} 

struct WMCreatePoolRequest { 
	1: optional WMPool pool 
} 

struct GrantRevokePrivilegeResponse { 
	1: optional bool success 
} 

struct CreationMetadata { 
	1: required string catName 
	2: required string dbName 
	3: required string tblName 
	4: required set<string> tablesUsed 
	5: optional string validTxnList 
	6: optional i64 materializationTime 
} 

struct AllocateTableWriteIdsResponse { 
	1: required list<TxnToWriteId> txnToWriteIds 
} 

struct GetPartitionRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: required list<string> partVals 
	5: optional string validWriteIdList 
	6: optional i64 id 
} 

struct WMAlterTriggerRequest { 
	1: optional WMTrigger trigger 
} 

struct ScheduledQuery { 
	1: required ScheduledQueryKey scheduleKey 
	2: optional bool enabled 
	4: optional string schedule 
	5: optional string user 
	6: optional string query 
	7: optional i32 nextExecution 
} 

struct GrantRevokePrivilegeRequest { 
	1: required GrantRevokeType requestType 
	2: required PrivilegeBag privileges 
	3: optional bool revokeGrantOption 
} 

struct ForeignKeysResponse { 
	1: required list<SQLForeignKey> foreignKeys 
} 

struct GetDatabaseRequest { 
	1: optional string name 
	2: optional string catalogName 
	3: optional list<string> processorCapabilities 
	4: optional string processorIdentifier 
} 

struct WMCreateTriggerRequest { 
	1: optional WMTrigger trigger 
} 

struct WMCreateOrUpdateMappingResponse { 
} 

struct GetSchemaRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional EnvironmentContext envContext 
	5: optional string validWriteIdList 
	6: optional i64 id 
} 

struct SQLCheckConstraint { 
	1: required string catName 
	2: required string table_db 
	3: required string table_name 
	4: required string column_name 
	5: required string check_expression 
	6: required string dc_name 
	7: required bool enable_cstr 
	8: required bool validate_cstr 
	9: required bool rely_cstr 
} 

struct RolePrincipalGrant { 
	1: required string roleName 
	2: required string principalName 
	3: required PrincipalType principalType 
	4: required bool grantOption 
	5: required i32 grantTime 
	6: required string grantorName 
	7: required PrincipalType grantorPrincipalType 
} 

struct ClientCapabilities { 
	1: required list<ClientCapability> values 
} 

struct WMResourcePlan { 
	1: required string name 
	2: optional WMResourcePlanStatus status 
	3: optional i32 queryParallelism 
	4: optional string defaultPoolPath 
	5: optional string ns 
} 

struct CacheFileMetadataResult { 
	1: required bool isSupported 
} 

struct WMNullablePool { 
	1: required string resourcePlanName 
	2: required string poolPath 
	3: optional double allocFraction 
	4: optional i32 queryParallelism 
	5: optional string schedulingPolicy 
	6: optional bool isSetSchedulingPolicy 
	7: optional string ns 
} 

struct Order { 
	1: required string col 
	2: required i32 order 
} 

struct CompactionResponse { 
	1: required i64 id 
	2: required string state 
	3: required bool accepted 
} 

struct GetTablesExtRequest { 
	1: required string catalog 
	2: required string database 
	3: required string tableNamePattern 
	4: required i32 requestedFields 
	5: optional i32 limit 
	6: optional list<string> processorCapabilities 
	7: optional string processorIdentifier 
} 

struct GetPartitionsFilterSpec { 
	7: optional PartitionFilterMode filterMode 
	8: optional list<string> filters 
} 

struct GetTableRequest { 
	1: required string dbName 
	2: required string tblName 
	3: optional ClientCapabilities capabilities 
	4: optional string catName 
	6: optional string validWriteIdList 
	7: optional bool getColumnStats 
	8: optional list<string> processorCapabilities 
	9: optional string processorIdentifier 
	10: optional string engine 
	11: optional i64 id 
} 

struct CmRecycleResponse { 
} 

struct WMNullableResourcePlan { 
	1: optional string name 
	2: optional WMResourcePlanStatus status 
	4: optional i32 queryParallelism 
	5: optional bool isSetQueryParallelism 
	6: optional string defaultPoolPath 
	7: optional bool isSetDefaultPoolPath 
	8: optional string ns 
} 

struct WMGetAllResourcePlanResponse { 
	1: optional list<WMResourcePlan> resourcePlans 
} 

struct GetTablesRequest { 
	1: required string dbName 
	2: optional list<string> tblNames 
	3: optional ClientCapabilities capabilities 
	4: optional string catName 
	5: optional list<string> processorCapabilities 
	6: optional string processorIdentifier 
	7: optional GetProjectionsSpec projectionSpec 
} 

struct GetPartitionsPsWithAuthRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional list<string> partVals 
	5: optional i16 maxParts 
	6: optional string userName 
	7: optional list<string> groupNames 
	8: optional string validWriteIdList 
	9: optional i64 id 
} 

struct WMPool { 
	1: required string resourcePlanName 
	2: required string poolPath 
	3: optional double allocFraction 
	4: optional i32 queryParallelism 
	5: optional string schedulingPolicy 
	6: optional string ns 
} 

struct Database { 
	1: required string name 
	2: required string description 
	3: required string locationUri 
	4: required map<string,string> parameters 
	5: optional PrincipalPrivilegeSet privileges 
	6: optional string ownerName 
	7: optional PrincipalType ownerType 
	8: optional string catalogName 
	9: optional i32 createTime 
	10: optional string managedLocationUri 
} 

struct TableStatsResult { 
	1: required list<ColumnStatisticsObj> tableStats 
	2: optional bool isStatsCompliant 
} 

struct GetFileMetadataByExprRequest { 
	1: required list<i64> fileIds 
	2: required binary expr 
	3: optional bool doGetFooters 
	4: optional FileMetadataExprType type 
} 

struct ClearFileMetadataRequest { 
	1: required list<i64> fileIds 
} 

struct WMGetTriggersForResourePlanRequest { 
	1: optional string resourcePlanName 
	2: optional string ns 
} 

struct TimestampColumnStatsData { 
	1: optional Timestamp lowValue 
	2: optional Timestamp highValue 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct ShowCompactResponse { 
	1: required list<ShowCompactResponseElement> compacts 
} 

struct NotificationEventsCountResponse { 
	1: required i64 eventsCount 
} 

struct Materialization { 
	1: required bool sourceTablesUpdateDeleteModified 
} 

struct NotificationEventResponse { 
	1: required list<NotificationEvent> events 
} 

struct FireEventRequest { 
	1: required bool successful 
	2: required FireEventRequestData data 
	3: optional string dbName 
	4: optional string tableName 
	5: optional list<string> partitionVals 
	6: optional string catName 
} 

struct WMAlterPoolRequest { 
	1: optional WMNullablePool pool 
	2: optional string poolPath 
} 

struct RenamePartitionRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tableName 
	4: required list<string> partVals 
	5: required Partition newPart 
	6: optional string validWriteIdList 
} 

struct BinaryColumnStatsData { 
	1: required i64 maxColLen 
	2: required double avgColLen 
	3: required i64 numNulls 
	4: optional binary bitVectors 
} 

struct WMDropResourcePlanRequest { 
	1: optional string resourcePlanName 
	2: optional string ns 
} 

struct AlterPartitionsResponse { 
} 

struct Schema { 
	1: required list<FieldSchema> fieldSchemas 
	2: required map<string,string> properties 
} 

struct DropPartitionsResult { 
	1: optional list<Partition> partitions 
} 

struct GetValidWriteIdsRequest { 
	1: required list<string> fullTableNames 
	2: optional string validTxnList 
	3: optional i64 writeId 
} 

struct LockComponent { 
	1: required LockType type 
	2: required LockLevel level 
	3: required string dbname 
	4: optional string tablename 
	5: optional string partitionname 
	6: optional DataOperationType operationType 
	7: optional bool isTransactional 
	8: optional bool isDynamicPartitionWrite 
} 

struct BasicTxnInfo { 
	1: required bool isnull 
	2: optional i64 time 
	3: optional i64 txnid 
	4: optional string dbname 
	5: optional string tablename 
	6: optional string partitionname 
} 

struct WriteNotificationLogRequest { 
	1: required i64 txnId 
	2: required i64 writeId 
	3: required string db 
	4: required string table 
	5: required InsertEventRequestData fileInfo 
	6: optional list<string> partitionVals 
} 

struct CmRecycleRequest { 
	1: required string dataPath 
	2: required bool purge 
} 

struct GetFieldsResponse { 
	1: required list<FieldSchema> fields 
} 

struct SQLUniqueConstraint { 
	1: required string catName 
	2: required string table_db 
	3: required string table_name 
	4: required string column_name 
	5: required i32 key_seq 
	6: required string uk_name 
	7: required bool enable_cstr 
	8: required bool validate_cstr 
	9: required bool rely_cstr 
} 

struct GrantRevokeRoleResponse { 
	1: optional bool success 
} 

struct CheckConstraintsResponse { 
	1: required list<SQLCheckConstraint> checkConstraints 
} 

struct TxnToWriteId { 
	1: required i64 txnId 
	2: required i64 writeId 
} 

struct WriteNotificationLogResponse { 
} 

struct GetAllFunctionsResponse { 
	1: optional list<Function> functions 
} 

struct GetPartitionResponse { 
	1: required Partition partition 
} 

struct GetCatalogResponse { 
	1: required Catalog catalog 
} 

struct Decimal { 
	3: required i16 scale 
	1: required binary unscaled 
} 

struct OptionalCompactionInfoStruct { 
	1: optional CompactionInfoStruct ci 
} 

struct InsertEventRequestData { 
	1: optional bool replace 
	2: required list<string> filesAdded 
	3: optional list<string> filesAddedChecksum 
	4: optional list<string> subDirectoryList 
	5: optional list<string> partitionVal 
} 

struct HeartbeatTxnRangeResponse { 
	1: required set<i64> aborted 
	2: required set<i64> nosuch 
} 

struct StoredProcedure { 
	1: required string name 
	2: required string dbName 
	3: required string catName 
	4: required string ownerName 
	5: required string source 
} 

struct TruncateTableResponse { 
} 

struct LongColumnStatsData { 
	1: optional i64 lowValue 
	2: optional i64 highValue 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct PartitionsStatsResult { 
	1: required map<string,list<ColumnStatisticsObj>> partStats 
	2: optional bool isStatsCompliant 
} 

struct AllocateTableWriteIdsRequest { 
	1: required string dbName 
	2: required string tableName 
	3: optional list<i64> txnIds 
	4: optional string replPolicy 
	5: optional list<TxnToWriteId> srcTxnToWriteIdList 
} 

struct PrivilegeBag { 
	1: required list<HiveObjectPrivilege> privileges 
} 

struct DropPartitionsExpr { 
	1: required binary expr 
	2: optional i32 partArchiveLevel 
} 

struct NotificationEvent { 
	1: required i64 eventId 
	2: required i32 eventTime 
	3: required string eventType 
	4: optional string dbName 
	5: optional string tableName 
	6: required string message 
	7: optional string messageFormat 
	8: optional string catName 
} 

struct WMCreateResourcePlanRequest { 
	1: optional WMResourcePlan resourcePlan 
	2: optional string copyFrom 
} 

struct WMCreateOrDropTriggerToPoolMappingResponse { 
} 

struct AlterTableResponse { 
} 

struct ListStoredProcedureRequest { 
	1: required string catName 
	2: optional string dbName 
} 

struct DateColumnStatsData { 
	1: optional Date lowValue 
	2: optional Date highValue 
	3: required i64 numNulls 
	4: required i64 numDVs 
	5: optional binary bitVectors 
} 

struct CurrentNotificationEventId { 
	1: required i64 eventId 
} 

struct GetProjectionsSpec { 
	1: required list<string> fieldList 
	2: required string includeParamKeyPattern 
	3: required string excludeParamKeyPattern 
} 

struct GetPartitionsRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional bool withAuth 
	5: optional string user 
	6: optional list<string> groupNames 
	7: required GetProjectionsSpec projectionSpec 
	8: required GetPartitionsFilterSpec filterSpec 
	9: optional list<string> processorCapabilities 
	10: optional string processorIdentifier 
	11: optional string validWriteIdList 
} 

struct AlterISchemaRequest { 
	1: required ISchemaName name 
	3: required ISchema newSchema 
} 

struct EnvironmentContext { 
	1: required map<string,string> properties 
} 

struct PartitionsByExprRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required binary expr 
	4: optional string defaultPartitionName 
	5: optional i16 maxParts 
	6: optional string catName 
	7: optional string order 
	8: optional string validWriteIdList 
	9: optional i64 id 
} 

struct GetValidWriteIdsResponse { 
	1: required list<TableValidWriteIds> tblValidWriteIds 
} 

struct HeartbeatTxnRangeRequest { 
	1: required i64 min 
	2: required i64 max 
} 

struct GetPartitionNamesPsRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tblName 
	4: optional list<string> partValues 
	5: optional i16 maxParts 
	6: optional string validWriteIdList 
	7: optional i64 id 
} 

struct MaxAllocatedTableWriteIdResponse { 
	1: required i64 maxWriteId 
} 

struct LockRequest { 
	1: required list<LockComponent> component 
	2: optional i64 txnid 
	3: required string user 
	4: required string hostname 
	5: optional string agentInfo 
	6: optional bool zeroWaitReadEnabled 
} 

struct NotificationEventRequest { 
	1: required i64 lastEvent 
	2: optional i32 maxEvents 
	3: optional list<string> eventTypeSkipList 
} 

struct WMCreateTriggerResponse { 
} 

struct Version { 
	1: required string version 
	2: required string comments 
} 

struct PrimaryKeysResponse { 
	1: required list<SQLPrimaryKey> primaryKeys 
} 

struct AddDefaultConstraintRequest { 
	1: required list<SQLDefaultConstraint> defaultConstraintCols 
} 

struct PrivilegeGrantInfo { 
	1: required string privilege 
	2: required i32 createTime 
	3: required string grantor 
	4: required PrincipalType grantorType 
	5: required bool grantOption 
} 

struct UniqueConstraintsResponse { 
	1: required list<SQLUniqueConstraint> uniqueConstraints 
} 

struct MetadataPpdResult { 
	1: optional binary metadata 
	2: optional binary includeBitset 
} 

struct UnlockRequest { 
	1: required i64 lockid 
} 

struct SchemaVersionDescriptor { 
	1: required ISchemaName schema 
	2: required i32 version 
} 

struct SQLPrimaryKey { 
	1: required string table_db 
	2: required string table_name 
	3: required string column_name 
	4: required i32 key_seq 
	5: required string pk_name 
	6: required bool enable_cstr 
	7: required bool validate_cstr 
	8: required bool rely_cstr 
	9: optional string catName 
} 

struct SQLForeignKey { 
	1: required string pktable_db 
	2: required string pktable_name 
	3: required string pkcolumn_name 
	4: required string fktable_db 
	5: required string fktable_name 
	6: required string fkcolumn_name 
	7: required i32 key_seq 
	8: required i32 update_rule 
	9: required i32 delete_rule 
	10: required string fk_name 
	11: required string pk_name 
	12: required bool enable_cstr 
	13: required bool validate_cstr 
	14: required bool rely_cstr 
	15: optional string catName 
} 

struct AddCheckConstraintRequest { 
	1: required list<SQLCheckConstraint> checkConstraintCols 
} 

struct PartitionsStatsRequest { 
	1: required string dbName 
	2: required string tblName 
	3: required list<string> colNames 
	4: required list<string> partNames 
	5: optional string catName 
	6: optional string validWriteIdList 
	7: required string engine 
} 

struct DropCatalogRequest { 
	1: required string name 
} 

struct PartitionWithoutSD { 
	1: required list<string> values 
	2: required i32 createTime 
	3: required i32 lastAccessTime 
	4: required string relativePath 
	5: required map<string,string> parameters 
	6: optional PrincipalPrivilegeSet privileges 
} 

struct AddNotNullConstraintRequest { 
	1: required list<SQLNotNullConstraint> notNullConstraintCols 
} 

struct SetSchemaVersionStateRequest { 
	1: required SchemaVersionDescriptor schemaVersion 
	2: required SchemaVersionState state 
} 

struct AlterTableRequest { 
	1: optional string catName 
	2: required string dbName 
	3: required string tableName 
	4: required Table table 
	5: optional EnvironmentContext environmentContext 
	6: optional i64 writeId 
	7: optional string validWriteIdList 
	8: optional list<string> processorCapabilities 
	9: optional string processorIdentifier 
} 

struct ShowLocksResponse { 
	1: required list<ShowLocksResponseElement> locks 
} 

struct ShowCompactRequest { 
} 

struct WMFullResourcePlan { 
	1: required WMResourcePlan plan 
	2: required list<WMPool> pools 
	3: optional list<WMMapping> mappings 
	4: optional list<WMTrigger> triggers 
	5: optional list<WMPoolTrigger> poolTriggers 
} 

struct WMDropMappingRequest { 
	1: optional WMMapping mapping 
} 

struct GetTableResult { 
	1: required Table table 
	2: optional bool isStatsCompliant 
} 

struct WMGetResourcePlanRequest { 
	1: optional string resourcePlanName 
	2: optional string ns 
} 

struct WMValidateResourcePlanRequest { 
	1: optional string resourcePlanName 
	2: optional string ns 
} 

struct GetRuntimeStatsRequest { 
	1: required i32 maxWeight 
	2: required i32 maxCreateTime 
} 

struct CheckConstraintsRequest { 
	1: required string catName 
	2: required string db_name 
	3: required string tbl_name 
} 

struct Function { 
	1: required string functionName 
	2: required string dbName 
	3: required string className 
	4: required string ownerName 
	5: required PrincipalType ownerType 
	6: required i32 createTime 
	7: required FunctionType functionType 
	8: required list<ResourceUri> resourceUris 
	9: optional string catName 
} 

struct LockResponse { 
	1: required i64 lockid 
	2: required LockState state 
	3: optional string errorMessage 
} 

struct GetFileMetadataByExprResult { 
	1: required map<i64,MetadataPpdResult> metadata 
	2: required bool isSupported 
} 

struct GetRoleGrantsForPrincipalRequest { 
	1: required string principal_name 
	2: required PrincipalType principal_type 
} 

union ColumnStatisticsData { 
	1: optional BooleanColumnStatsData booleanStats 
	2: optional LongColumnStatsData longStats 
	3: optional DoubleColumnStatsData doubleStats 
	4: optional StringColumnStatsData stringStats 
	5: optional BinaryColumnStatsData binaryStats 
	6: optional DecimalColumnStatsData decimalStats 
	7: optional DateColumnStatsData dateStats 
	8: optional TimestampColumnStatsData timestampStats 
} 

union RequestPartsSpec { 
	1: optional list<string> names 
	2: optional list<DropPartitionsExpr> exprs 
} 

union FireEventRequestData { 
	1: optional InsertEventRequestData insertData 
	2: optional list<InsertEventRequestData> insertDatas 
} 


enum SchemaType { 
	HIVE = 1 
	AVRO = 2 
} 

enum ResourceType { 
	JAR = 1 
	FILE = 2 
	ARCHIVE = 3 
} 

enum CompactionType { 
	MINOR = 1 
	MAJOR = 2 
} 

enum TxnType { 
	MATER_VIEW_REBUILD = 4 
	DEFAULT = 0 
	REPL_CREATED = 1 
	READ_ONLY = 2 
	COMPACTION = 3 
} 

enum PartitionEventType { 
	LOAD_DONE = 1 
} 

enum TxnState { 
	OPEN = 3 
	COMMITTED = 1 
	ABORTED = 2 
} 

enum LockLevel { 
	DB = 1 
	TABLE = 2 
	PARTITION = 3 
} 

enum ClientCapability { 
	TEST_CAPABILITY = 1 
	INSERT_ONLY_TABLES = 2 
} 

enum PrincipalType { 
	ROLE = 2 
	GROUP = 3 
	USER = 1 
} 

enum GrantRevokeType { 
	GRANT = 1 
	REVOKE = 2 
} 

enum SerdeType { 
	HIVE = 1 
	SCHEMA_REGISTRY = 2 
} 

enum FileMetadataExprType { 
	ORC_SARG = 1 
} 

enum WMPoolSchedulingPolicy { 
	FAIR = 1 
	FIFO = 2 
} 

enum LockType { 
	SHARED_READ = 1 
	SHARED_WRITE = 2 
	EXCLUSIVE = 3 
	EXCL_WRITE = 4 
} 

enum DataOperationType { 
	SELECT = 1 
	INSERT = 2 
	UPDATE = 3 
	DELETE = 4 
	UNSET = 5 
	NO_TXN = 6 
} 

enum SchemaCompatibility { 
	BACKWARD = 2 
	FORWARD = 3 
	BOTH = 4 
	NONE = 1 
} 

enum LockState { 
	NOT_ACQUIRED = 4 
	ACQUIRED = 1 
	WAITING = 2 
	ABORT = 3 
} 

enum SchemaValidation { 
	LATEST = 1 
	ALL = 2 
} 

enum HiveObjectType { 
	GLOBAL = 1 
	DATABASE = 2 
	TABLE = 3 
	PARTITION = 4 
	COLUMN = 5 
} 

enum GetTablesExtRequestFields { 
	ALL = 2147483647 
	ACCESS_TYPE = 1 
	PROCESSOR_CAPABILITIES = 2 
} 

enum EventRequestType { 
	INSERT = 1 
	UPDATE = 2 
	DELETE = 3 
} 

enum SchemaVersionState { 
	START_REVIEW = 2 
	CHANGES_REQUIRED = 3 
	REVIEWED = 4 
	ENABLED = 5 
	DISABLED = 6 
	ARCHIVED = 7 
	DELETED = 8 
	INITIATED = 1 
} 

enum FunctionType { 
	JAVA = 1 
} 

enum PartitionFilterMode { 
	BY_NAMES = 0 
	BY_VALUES = 1 
	BY_EXPR = 2 
} 

enum WMResourcePlanStatus { 
	ENABLED = 2 
	DISABLED = 3 
	ACTIVE = 1 
} 

enum ScheduledQueryMaintenanceRequestType { 
	DROP = 3 
	CREATE = 1 
	ALTER = 2 
} 

enum QueryState { 
	INITED = 0 
	EXECUTING = 1 
	FAILED = 2 
	FINISHED = 3 
	TIMED_OUT = 4 
} 



exception TxnAbortedException { 
	1: required string message 
} 

exception NoSuchLockException { 
	1: required string message 
} 

exception MetaException { 
	1: required string message 
} 

exception InvalidPartitionException { 
	1: required string message 
} 

exception NoSuchObjectException { 
	1: required string message 
} 

exception InvalidOperationException { 
	1: required string message 
} 

exception ConfigValSecurityException { 
	1: required string message 
} 

exception InvalidInputException { 
	1: required string message 
} 

exception UnknownTableException { 
	1: required string message 
} 

exception UnknownPartitionException { 
	1: required string message 
} 

exception TxnOpenException { 
	1: required string message 
} 

exception IndexAlreadyExistsException { 
	1: required string message 
} 

exception UnknownDBException { 
	1: required string message 
} 

exception InvalidObjectException { 
	1: required string message 
} 

exception AlreadyExistsException { 
	1: required string message 
} 

exception NoSuchTxnException { 
	1: required string message 
} 



service ThriftHiveMetastore extends fb303.FacebookService { 
	list<PartitionSpec> get_part_specs_by_filter (1: string db_name, 2: string tbl_name, 3: string filter, 4: i32 max_parts) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void alter_function (1: string dbName, 2: string funcName, 3: Function newFunc) throws (1: InvalidOperationException o1, 2: MetaException o2)
	void abort_txns (1: AbortTxnsRequest rqst) throws (1: NoSuchTxnException o1)
	i64 renew_delegation_token (1: string token_str_form) throws (1: MetaException o1)
	ReplicationMetricList get_replication_metrics (1: GetReplicationMetricsRequest rqst) throws (1: MetaException o1)
	void alter_catalog (1: AlterCatalogRequest rqst) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	bool isPartitionMarkedForEvent (1: string db_name, 2: string tbl_name, 3: map<string,string> part_vals, 4: PartitionEventType eventType) throws (1: MetaException o1, 2: NoSuchObjectException o2, 3: UnknownDBException o3, 4: UnknownTableException o4, 5: UnknownPartitionException o5, 6: InvalidPartitionException o6)
	PartitionsStatsResult get_partitions_statistics_req (1: PartitionsStatsRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	bool create_role (1: Role role) throws (1: MetaException o1)
	GrantRevokePrivilegeResponse grant_revoke_privileges (1: GrantRevokePrivilegeRequest request) throws (1: MetaException o1)
	void seed_write_id (1: SeedTableWriteIdsRequest rqst) throws (1: MetaException o1)
	void compact (1: CompactionRequest rqst)
	list<string> find_columns_with_stats (1: CompactionInfoStruct cr)
	list<string> get_partition_names_ps (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: i16 max_parts) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	GetPartitionsByNamesResult get_partitions_by_names_req (1: GetPartitionsByNamesRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void alter_partitions (1: string db_name, 2: string tbl_name, 3: list<Partition> new_parts) throws (1: InvalidOperationException o1, 2: MetaException o2)
	map<string,string> partition_name_to_spec (1: string part_name) throws (1: MetaException o1)
	string get_metastore_db_uuid () throws (1: MetaException o1)
	bool heartbeat_lock_materialization_rebuild (1: string dbName, 2: string tableName, 3: i64 txnId)
	bool update_partition_column_statistics (1: ColumnStatistics stats_obj) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: InvalidInputException o4)
	ColumnStatistics get_partition_column_statistics (1: string db_name, 2: string tbl_name, 3: string part_name, 4: string col_name) throws (1: NoSuchObjectException o1, 2: MetaException o2, 3: InvalidInputException o3, 4: InvalidObjectException o4)
	GetFileMetadataByExprResult get_file_metadata_by_expr (1: GetFileMetadataByExprRequest req)
	CacheFileMetadataResult cache_file_metadata (1: CacheFileMetadataRequest req)
	void drop_catalog (1: DropCatalogRequest catName) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	list<FieldSchema> get_fields_with_environment_context (1: string db_name, 2: string table_name, 3: EnvironmentContext environment_context) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	GetPartitionResponse get_partition_req (1: GetPartitionRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	CheckConstraintsResponse get_check_constraints (1: CheckConstraintsRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	i32 add_partitions (1: list<Partition> new_parts) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	i64 get_latest_txnid_in_conflict (1: i64 txnId) throws (1: MetaException o1)
	void drop_stored_procedure (1: StoredProcedureRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	WMAlterResourcePlanResponse alter_resource_plan (1: WMAlterResourcePlanRequest request) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	Partition get_partition_by_name (1: string db_name, 2: string tbl_name, 3: string part_name) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void alter_partition (1: string db_name, 2: string tbl_name, 3: Partition new_part) throws (1: InvalidOperationException o1, 2: MetaException o2)
	void commit_txn (1: CommitTxnRequest rqst) throws (1: NoSuchTxnException o1, 2: TxnAbortedException o2)
	void mark_compacted (1: CompactionInfoStruct cr) throws (1: MetaException o1)
	void create_stored_procedure (1: StoredProcedure proc) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	list<string> get_databases (1: string pattern) throws (1: MetaException o1)
	Partition append_partition_with_environment_context (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: EnvironmentContext environment_context) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	list<string> get_partition_names (1: string db_name, 2: string tbl_name, 3: i16 max_parts) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	GetPartitionsPsWithAuthResponse get_partitions_ps_with_auth_req (1: GetPartitionsPsWithAuthRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void add_runtime_stats (1: RuntimeStat stat) throws (1: MetaException o1)
	void drop_table_with_environment_context (1: string dbname, 2: string name, 3: bool deleteData, 4: EnvironmentContext environment_context) throws (1: NoSuchObjectException o1, 2: MetaException o3)
	GetPartitionNamesPsResponse get_partition_names_ps_req (1: GetPartitionNamesPsRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	GetFileMetadataResult get_file_metadata (1: GetFileMetadataRequest req)
	WMAlterTriggerResponse alter_wm_trigger (1: WMAlterTriggerRequest request) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3)
	bool remove_master_key (1: i32 key_seq)
	Partition append_partition_by_name_with_environment_context (1: string db_name, 2: string tbl_name, 3: string part_name, 4: EnvironmentContext environment_context) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	PartitionsSpecByExprResult get_partitions_spec_by_expr (1: PartitionsByExprRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	PrimaryKeysResponse get_primary_keys (1: PrimaryKeysRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<HiveObjectPrivilege> list_privileges (1: string principal_name, 2: PrincipalType principal_type, 3: HiveObjectRef hiveObject) throws (1: MetaException o1)
	GetOpenTxnsResponse get_open_txns ()
	Index add_index (1: Index new_index, 2: Table index_table) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	list<string> get_all_stored_procedures (1: ListStoredProcedureRequest request) throws (1: MetaException o1)
	Partition append_partition_by_name (1: string db_name, 2: string tbl_name, 3: string part_name) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	list<Partition> get_partitions_ps (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: i16 max_parts) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	AllTableConstraintsResponse get_all_table_constraints (1: AllTableConstraintsRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	GrantRevokeRoleResponse grant_revoke_role (1: GrantRevokeRoleRequest request) throws (1: MetaException o1)
	list<string> get_tables_by_type (1: string db_name, 2: string pattern, 3: string tableType) throws (1: MetaException o1)
	PartitionValuesResponse get_partition_values (1: PartitionValuesRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	AggrStats get_aggr_stats_for (1: PartitionsStatsRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	WMCreateResourcePlanResponse create_resource_plan (1: WMCreateResourcePlanRequest request) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3)
	WMDropTriggerResponse drop_wm_trigger (1: WMDropTriggerRequest request) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	SerDeInfo get_serde (1: GetSerdeRequest rqst) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	list<string> get_all_databases () throws (1: MetaException o1)
	bool revoke_privileges (1: PrivilegeBag privileges) throws (1: MetaException o1)
	string get_delegation_token (1: string token_owner, 2: string renewer_kerberos_principal_name) throws (1: MetaException o1)
	WMCreateTriggerResponse create_wm_trigger (1: WMCreateTriggerRequest request) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: MetaException o4)
	SetPartitionsStatsResponse update_partition_column_statistics_req (1: SetPartitionsStatsRequest req) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: InvalidInputException o4)
	void add_schema_version (1: SchemaVersion schemaVersion) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: MetaException o3)
	list<SchemaVersion> get_schema_all_versions (1: ISchemaName schemaName) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void drop_constraint (1: DropConstraintRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o3)
	NotificationEventsCountResponse get_notification_events_count (1: NotificationEventsCountRequest rqst)
	AlterPartitionsResponse alter_partitions_req (1: AlterPartitionsRequest req) throws (1: InvalidOperationException o1, 2: MetaException o2)
	list<string> get_functions (1: string dbName, 2: string pattern) throws (1: MetaException o1)
	void add_serde (1: SerDeInfo serde) throws (1: AlreadyExistsException o1, 2: MetaException o2)
	void flushCache ()
	GetSchemaResponse get_schema_req (1: GetSchemaRequest req) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	void create_table_with_environment_context (1: Table tbl, 2: EnvironmentContext environment_context) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: NoSuchObjectException o4)
	void alter_partition_with_environment_context (1: string db_name, 2: string tbl_name, 3: Partition new_part, 4: EnvironmentContext environment_context) throws (1: InvalidOperationException o1, 2: MetaException o2)
	void cancel_delegation_token (1: string token_str_form) throws (1: MetaException o1)
	list<Partition> get_partitions_with_auth (1: string db_name, 2: string tbl_name, 3: i16 max_parts, 4: string user_name, 5: list<string> group_names) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	RenamePartitionResponse rename_partition_req (1: RenamePartitionRequest req) throws (1: InvalidOperationException o1, 2: MetaException o2)
	string get_config_value (1: string name, 2: string defaultValue) throws (1: ConfigValSecurityException o1)
	void setMetaConf (1: string key, 2: string value) throws (1: MetaException o1)
	GetCatalogsResponse get_catalogs () throws (1: MetaException o1)
	Type get_type (1: string name) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void add_not_null_constraint (1: AddNotNullConstraintRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	ColumnStatistics get_table_column_statistics (1: string db_name, 2: string tbl_name, 3: string col_name) throws (1: NoSuchObjectException o1, 2: MetaException o2, 3: InvalidInputException o3, 4: InvalidObjectException o4)
	GrantRevokePrivilegeResponse refresh_privileges (1: HiveObjectRef objToRefresh, 2: string authorizer, 3: GrantRevokePrivilegeRequest grantRequest) throws (1: MetaException o1)
	void map_schema_version_to_serde (1: MapSchemaVersionToSerdeRequest rqst) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	ScheduledQuery get_scheduled_query (1: ScheduledQueryKey scheduleKey) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	string get_token (1: string token_identifier)
	AllocateTableWriteIdsResponse allocate_table_write_ids (1: AllocateTableWriteIdsRequest rqst) throws (1: NoSuchTxnException o1, 2: TxnAbortedException o2, 3: MetaException o3)
	void create_catalog (1: CreateCatalogRequest catalog) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3)
	list<Partition> get_partitions_by_filter (1: string db_name, 2: string tbl_name, 3: string filter, 4: i16 max_parts) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	UniqueConstraintsResponse get_unique_constraints (1: UniqueConstraintsRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void drop_function (1: string dbName, 2: string funcName) throws (1: NoSuchObjectException o1, 2: MetaException o3)
	void truncate_table (1: string dbName, 2: string tableName, 3: list<string> partNames) throws (1: MetaException o1)
	list<string> get_table_names_by_filter (1: string dbname, 2: string filter, 3: i16 max_tables) throws (1: MetaException o1, 2: InvalidOperationException o2, 3: UnknownDBException o3)
	WriteNotificationLogResponse add_write_notification_log (1: WriteNotificationLogRequest rqst)
	list<string> partition_name_to_vals (1: string part_name) throws (1: MetaException o1)
	list<FieldSchema> get_schema_with_environment_context (1: string db_name, 2: string table_name, 3: EnvironmentContext environment_context) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	void add_foreign_key (1: AddForeignKeyRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	bool drop_partition_by_name (1: string db_name, 2: string tbl_name, 3: string part_name, 4: bool deleteData) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	bool drop_partition_by_name_with_environment_context (1: string db_name, 2: string tbl_name, 3: string part_name, 4: bool deleteData, 5: EnvironmentContext environment_context) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void set_hadoop_jobid (1: string jobId, 2: i64 cq_id)
	WMCreateOrUpdateMappingResponse create_or_update_wm_mapping (1: WMCreateOrUpdateMappingRequest request) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: MetaException o4)
	void add_replication_metrics (1: ReplicationMetricList replicationMetricList) throws (1: MetaException o1)
	bool create_type (1: Type type) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3)
	AddPartitionsResult add_partitions_req (1: AddPartitionsRequest request) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	list<Role> list_roles (1: string principal_name, 2: PrincipalType principal_type) throws (1: MetaException o1)
	GetOpenTxnsInfoResponse get_open_txns_info ()
	list<Index> get_indexes (1: string db_name, 2: string tbl_name, 3: i16 max_indexes) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	GetFieldsResponse get_fields_req (1: GetFieldsRequest req) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	i32 add_partitions_pspec (1: list<PartitionSpec> new_parts) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	WMValidateResourcePlanResponse validate_resource_plan (1: WMValidateResourcePlanRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	ISchema get_ischema (1: ISchemaName name) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	GetTableResult get_table_req (1: GetTableRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<Partition> get_partitions_ps_with_auth (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: i16 max_parts, 5: string user_name, 6: list<string> group_names) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	GetPartitionsResponse get_partitions_with_specs (1: GetPartitionsRequest request) throws (1: MetaException o1)
	bool add_token (1: string token_identifier, 2: string delegation_token)
	void update_master_key (1: i32 seq_number, 2: string key) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	LockResponse check_lock (1: CheckLockRequest rqst) throws (1: NoSuchTxnException o1, 2: TxnAbortedException o2, 3: NoSuchLockException o3)
	WMDropResourcePlanResponse drop_resource_plan (1: WMDropResourcePlanRequest request) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	GetValidWriteIdsResponse get_valid_write_ids (1: GetValidWriteIdsRequest rqst) throws (1: NoSuchTxnException o1, 2: MetaException o2)
	void drop_ischema (1: ISchemaName name) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	void alter_database (1: string dbname, 2: Database db) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<string> get_materialized_views_for_rewriting (1: string db_name) throws (1: MetaException o1)
	bool delete_table_column_statistics (1: string db_name, 2: string tbl_name, 3: string col_name, 4: string engine) throws (1: NoSuchObjectException o1, 2: MetaException o2, 3: InvalidObjectException o3, 4: InvalidInputException o4)
	GetCatalogResponse get_catalog (1: GetCatalogRequest catName) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	list<Table> get_table_objects_by_name (1: string dbname, 2: list<string> tbl_names)
	list<PartitionSpec> get_partitions_pspec (1: string db_name, 2: string tbl_name, 3: i32 max_parts) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	SetPartitionsStatsResponse update_table_column_statistics_req (1: SetPartitionsStatsRequest req) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: InvalidInputException o4)
	list<string> get_index_names (1: string db_name, 2: string tbl_name, 3: i16 max_indexes) throws (1: MetaException o2)
	list<ExtendedTableInfo> get_tables_ext (1: GetTablesExtRequest req) throws (1: MetaException o1)
	bool grant_role (1: string role_name, 2: string principal_name, 3: PrincipalType principal_type, 4: string grantor, 5: PrincipalType grantorType, 6: bool grant_option) throws (1: MetaException o1)
	bool remove_token (1: string token_identifier)
	HeartbeatTxnRangeResponse heartbeat_txn_range (1: HeartbeatTxnRangeRequest txns)
	Partition add_partition_with_environment_context (1: Partition new_part, 2: EnvironmentContext environment_context) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	Partition append_partition (1: string db_name, 2: string tbl_name, 3: list<string> part_vals) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	void add_dynamic_partitions (1: AddDynamicPartitions rqst) throws (1: NoSuchTxnException o1, 2: TxnAbortedException o2)
	LockResponse get_lock_materialization_rebuild (1: string dbName, 2: string tableName, 3: i64 txnId)
	SchemaVersion get_schema_latest_version (1: ISchemaName schemaName) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	Database get_database (1: string name) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	NotNullConstraintsResponse get_not_null_constraints (1: NotNullConstraintsRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	TableStatsResult get_table_statistics_req (1: TableStatsRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void seed_txn_id (1: SeedTxnIdRequest rqst) throws (1: MetaException o1)
	void alter_ischema (1: AlterISchemaRequest rqst) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void create_database (1: Database database) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3)
	TruncateTableResponse truncate_table_req (1: TruncateTableRequest req) throws (1: MetaException o1)
	list<TableMeta> get_table_meta (1: string db_patterns, 2: string tbl_patterns, 3: list<string> tbl_types) throws (1: MetaException o1)
	Function get_function (1: string dbName, 2: string funcName) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	ShowCompactResponse show_compact (1: ShowCompactRequest rqst)
	void drop_table (1: string dbname, 2: string name, 3: bool deleteData) throws (1: NoSuchObjectException o1, 2: MetaException o3)
	void update_creation_metadata (1: string catName, 2: string dbname, 3: string tbl_name, 4: CreationMetadata creation_metadata) throws (1: MetaException o1, 2: InvalidOperationException o2, 3: UnknownDBException o3)
	list<string> get_all_token_identifiers ()
	void heartbeat (1: HeartbeatRequest ids) throws (1: NoSuchLockException o1, 2: NoSuchTxnException o2, 3: TxnAbortedException o3)
	GetAllFunctionsResponse get_all_functions () throws (1: MetaException o1)
	WMGetActiveResourcePlanResponse get_active_resource_plan (1: WMGetActiveResourcePlanRequest request) throws (1: MetaException o2)
	void create_table_req (1: CreateTableRequest request) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: NoSuchObjectException o4)
	void alter_table_with_cascade (1: string dbname, 2: string tbl_name, 3: Table new_tbl, 4: bool cascade) throws (1: InvalidOperationException o1, 2: MetaException o2)
	WMAlterPoolResponse alter_wm_pool (1: WMAlterPoolRequest request) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: MetaException o4)
	Table get_table (1: string dbname, 2: string tbl_name) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	Materialization get_materialization_invalidation_info (1: CreationMetadata creation_metadata, 2: string validTxnList) throws (1: MetaException o1, 2: InvalidOperationException o2, 3: UnknownDBException o3)
	LockResponse lock (1: LockRequest rqst) throws (1: NoSuchTxnException o1, 2: TxnAbortedException o2)
	ClearFileMetadataResult clear_file_metadata (1: ClearFileMetadataRequest req)
	bool drop_partition_with_environment_context (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: bool deleteData, 5: EnvironmentContext environment_context) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	i32 add_master_key (1: string key) throws (1: MetaException o1)
	void create_ischema (1: ISchema schema) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: MetaException o3)
	ScheduledQueryPollResponse scheduled_query_poll (1: ScheduledQueryPollRequest request) throws (1: MetaException o1)
	list<string> get_tables (1: string db_name, 2: string pattern) throws (1: MetaException o1)
	PartitionsResponse get_partitions_req (1: PartitionsRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	WMGetTriggersForResourePlanResponse get_triggers_for_resourceplan (1: WMGetTriggersForResourePlanRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	WMGetAllResourcePlanResponse get_all_resource_plans (1: WMGetAllResourcePlanRequest request) throws (1: MetaException o1)
	WMCreateOrDropTriggerToPoolMappingResponse create_or_drop_wm_trigger_to_pool_mapping (1: WMCreateOrDropTriggerToPoolMappingRequest request) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: MetaException o4)
	void alter_index (1: string dbname, 2: string base_tbl_name, 3: string idx_name, 4: Index new_idx) throws (1: InvalidOperationException o1, 2: MetaException o2)
	Partition get_partition (1: string db_name, 2: string tbl_name, 3: list<string> part_vals) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<string> get_partition_names_req (1: PartitionsByExprRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void create_function (1: Function func) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: NoSuchObjectException o4)
	WMGetResourcePlanResponse get_resource_plan (1: WMGetResourcePlanRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void create_table (1: Table tbl) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: NoSuchObjectException o4)
	AlterTableResponse alter_table_req (1: AlterTableRequest req) throws (1: InvalidOperationException o1, 2: MetaException o2)
	WMCreatePoolResponse create_wm_pool (1: WMCreatePoolRequest request) throws (1: AlreadyExistsException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: MetaException o4)
	list<string> get_master_keys ()
	void repl_tbl_writeid_state (1: ReplTblWriteIdStateRequest rqst)
	string getMetaConf (1: string key) throws (1: MetaException o1)
	void markPartitionForEvent (1: string db_name, 2: string tbl_name, 3: map<string,string> part_vals, 4: PartitionEventType eventType) throws (1: MetaException o1, 2: NoSuchObjectException o2, 3: UnknownDBException o3, 4: UnknownTableException o4, 5: UnknownPartitionException o5, 6: InvalidPartitionException o6)
	CompactionResponse compact2 (1: CompactionRequest rqst)
	OptionalCompactionInfoStruct find_next_compact (1: string workerId) throws (1: MetaException o1)
	PutFileMetadataResult put_file_metadata (1: PutFileMetadataRequest req)
	i32 get_num_partitions_by_filter (1: string db_name, 2: string tbl_name, 3: string filter) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	bool partition_name_has_valid_characters (1: list<string> part_vals, 2: bool throw_exception) throws (1: MetaException o1)
	bool delete_partition_column_statistics (1: string db_name, 2: string tbl_name, 3: string part_name, 4: string col_name, 5: string engine) throws (1: NoSuchObjectException o1, 2: MetaException o2, 3: InvalidObjectException o3, 4: InvalidInputException o4)
	GetPrincipalsInRoleResponse get_principals_in_role (1: GetPrincipalsInRoleRequest request) throws (1: MetaException o1)
	bool drop_partition (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: bool deleteData) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	list<string> get_role_names () throws (1: MetaException o1)
	WMDropMappingResponse drop_wm_mapping (1: WMDropMappingRequest request) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	CmRecycleResponse cm_recycle (1: CmRecycleRequest request) throws (1: MetaException o1)
	NotificationEventResponse get_next_notification (1: NotificationEventRequest rqst)
	Index get_index_by_name (1: string db_name, 2: string tbl_name, 3: string index_name) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	bool drop_type (1: string type) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<FieldSchema> get_fields (1: string db_name, 2: string table_name) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	void create_table_with_constraints (1: Table tbl, 2: list<SQLPrimaryKey> primaryKeys, 3: list<SQLForeignKey> foreignKeys, 4: list<SQLUniqueConstraint> uniqueConstraints, 5: list<SQLNotNullConstraint> notNullConstraints, 6: list<SQLDefaultConstraint> defaultConstraints, 7: list<SQLCheckConstraint> checkConstraints) throws (1: AlreadyExistsException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: NoSuchObjectException o4)
	Partition get_partition_with_auth (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: string user_name, 5: list<string> group_names) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	list<string> get_all_tables (1: string db_name) throws (1: MetaException o1)
	void set_schema_version_state (1: SetSchemaVersionStateRequest rqst) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	Database get_database_req (1: GetDatabaseRequest request) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	GetTablesResult get_table_objects_by_name_req (1: GetTablesRequest req) throws (1: MetaException o1, 2: InvalidOperationException o2, 3: UnknownDBException o3)
	list<RuntimeStat> get_runtime_stats (1: GetRuntimeStatsRequest rqst) throws (1: MetaException o1)
	StoredProcedure get_stored_procedure (1: StoredProcedureRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	void abort_txn (1: AbortTxnRequest rqst) throws (1: NoSuchTxnException o1)
	list<FieldSchema> get_schema (1: string db_name, 2: string table_name) throws (1: MetaException o1, 2: UnknownTableException o2, 3: UnknownDBException o3)
	Partition add_partition (1: Partition new_part) throws (1: InvalidObjectException o1, 2: AlreadyExistsException o2, 3: MetaException o3)
	list<string> set_ugi (1: string user_name, 2: list<string> group_names) throws (1: MetaException o1)
	OpenTxnsResponse open_txns (1: OpenTxnRequest rqst)
	bool set_aggr_stats_for (1: SetPartitionsStatsRequest request) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: InvalidInputException o4)
	bool revoke_role (1: string role_name, 2: string principal_name, 3: PrincipalType principal_type) throws (1: MetaException o1)
	void mark_failed (1: CompactionInfoStruct cr) throws (1: MetaException o1)
	void add_unique_constraint (1: AddUniqueConstraintRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void alter_table_with_environment_context (1: string dbname, 2: string tbl_name, 3: Table new_tbl, 4: EnvironmentContext environment_context) throws (1: InvalidOperationException o1, 2: MetaException o2)
	DropPartitionsResult drop_partitions_req (1: DropPartitionsRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	Partition exchange_partition (1: map<string,string> partitionSpecs, 2: string source_db, 3: string source_table_name, 4: string dest_db, 5: string dest_table_name) throws (1: MetaException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: InvalidInputException o4)
	void add_primary_key (1: AddPrimaryKeyRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void drop_schema_version (1: SchemaVersionDescriptor schemaVersion) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void scheduled_query_progress (1: ScheduledQueryProgressInfo info) throws (1: MetaException o1, 2: InvalidOperationException o2)
	void add_default_constraint (1: AddDefaultConstraintRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	FireEventResponse fire_listener_event (1: FireEventRequest rqst)
	DefaultConstraintsResponse get_default_constraints (1: DefaultConstraintsRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	PrincipalPrivilegeSet get_privilege_set (1: HiveObjectRef hiveObject, 2: string user_name, 3: list<string> group_names) throws (1: MetaException o1)
	void mark_cleaned (1: CompactionInfoStruct cr) throws (1: MetaException o1)
	ForeignKeysResponse get_foreign_keys (1: ForeignKeysRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	bool drop_role (1: string role_name) throws (1: MetaException o1)
	ShowLocksResponse show_locks (1: ShowLocksRequest rqst)
	void update_compactor_state (1: CompactionInfoStruct cr, 2: i64 txn_id)
	void add_check_constraint (1: AddCheckConstraintRequest req) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	list<Table> get_all_materialized_view_objects_for_rewriting () throws (1: MetaException o1)
	list<Partition> exchange_partitions (1: map<string,string> partitionSpecs, 2: string source_db, 3: string source_table_name, 4: string dest_db, 5: string dest_table_name) throws (1: MetaException o1, 2: NoSuchObjectException o2, 3: InvalidObjectException o3, 4: InvalidInputException o4)
	PartitionsByExprResult get_partitions_by_expr (1: PartitionsByExprRequest req) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	CurrentNotificationEventId get_current_notificationEventId ()
	map<string,Type> get_type_all (1: string name) throws (1: MetaException o2)
	MaxAllocatedTableWriteIdResponse get_max_allocated_table_write_id (1: MaxAllocatedTableWriteIdRequest rqst) throws (1: MetaException o1)
	GetOpenTxnsResponse get_open_txns_req (1: GetOpenTxnsRequest getOpenTxnsRequest)
	list<Partition> get_partitions_by_names (1: string db_name, 2: string tbl_name, 3: list<string> names) throws (1: MetaException o1, 2: NoSuchObjectException o2)
	GetRoleGrantsForPrincipalResponse get_role_grants_for_principal (1: GetRoleGrantsForPrincipalRequest request) throws (1: MetaException o1)
	FindSchemasByColsResp get_schemas_by_cols (1: FindSchemasByColsRqst rqst) throws (1: MetaException o1)
	void scheduled_query_maintenance (1: ScheduledQueryMaintenanceRequest request) throws (1: MetaException o1, 2: NoSuchObjectException o2, 3: AlreadyExistsException o3, 4: InvalidInputException o4)
	list<Partition> get_partitions (1: string db_name, 2: string tbl_name, 3: i16 max_parts) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	void rename_partition (1: string db_name, 2: string tbl_name, 3: list<string> part_vals, 4: Partition new_part) throws (1: InvalidOperationException o1, 2: MetaException o2)
	void unlock (1: UnlockRequest rqst) throws (1: NoSuchLockException o1, 2: TxnOpenException o2)
	SchemaVersion get_schema_version (1: SchemaVersionDescriptor schemaVersion) throws (1: NoSuchObjectException o1, 2: MetaException o2)
	WMDropPoolResponse drop_wm_pool (1: WMDropPoolRequest request) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	void drop_database (1: string name, 2: bool deleteData, 3: bool cascade) throws (1: NoSuchObjectException o1, 2: InvalidOperationException o2, 3: MetaException o3)
	void alter_table (1: string dbname, 2: string tbl_name, 3: Table new_tbl) throws (1: InvalidOperationException o1, 2: MetaException o2)
	void alter_partitions_with_environment_context (1: string db_name, 2: string tbl_name, 3: list<Partition> new_parts, 4: EnvironmentContext environment_context) throws (1: InvalidOperationException o1, 2: MetaException o2)
	bool grant_privileges (1: PrivilegeBag privileges) throws (1: MetaException o1)
	bool update_table_column_statistics (1: ColumnStatistics stats_obj) throws (1: NoSuchObjectException o1, 2: InvalidObjectException o2, 3: MetaException o3, 4: InvalidInputException o4)
	bool drop_index_by_name (1: string db_name, 2: string tbl_name, 3: string index_name, 4: bool deleteData) throws (1: NoSuchObjectException o1, 2: MetaException o2)
} 


