# thrift-extender
Can compare two Thrift IDL's to show difference with structs, services, constants and etc
and generate combined version of they both
;


To see diff between two files:
```
go run main.go hive_metastore_2_3.thrift hive_metastore_3.thrift
```
and you will see the entities that present in first file but doesnt exists in second file

Something like this:
```
struct [Index] doesnt exists in file [hive_metastore_3.thrift]
exception [IndexAlreadyExistsException] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[alter_index] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[add_index] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[get_index_names] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[get_index_by_name] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[get_indexes] doesnt exists in file [hive_metastore_3.thrift]
method [ThriftHiveMetastore]->[drop_index_by_name] doesnt exists in file [hive_metastore_3.thrift]
```
(see this if compare files hive_metastore_2_3.thrift and hive_metastore_3.thrift)


To generate combined version of your files run command:
```
go run main.go hive_metastore_2_3.thrift hive_metastore_3.thrift combinedThriftFile.thrift 
```





You can validate generated files with command
```
thrift -gen java combinedThriftFile.thrift     
```




I create only for one case:

Compare two IDL from Hive MetaStore version 2.3 and 3.1.2 with some structs that dropped support(Index) and extendings with Catalogs and other stuff;

https://github.com/apache/hive/blob/master/standalone-metastore/metastore-common/src/main/thrift/hive_metastore.thrift

https://github.com/apache/hive/blob/branch-2.3/metastore/if/hive_metastore.thrift

I need it for compatibility reason in my case;


Special Thx to https://github.com/samuel/go-thrift that script based


Known issues:
 -[ ] error while parsing if constant have comma at the end of line
 -[ ] . 

P.S. Sorry for my English. I'm not native speaker.
