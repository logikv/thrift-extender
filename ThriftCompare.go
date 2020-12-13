package main

import (
	"flag"
	"github.com/samuel/go-thrift/parser"
	"log"
	"os"
	generator2 "thrift-extender/generator"
	parser2 "thrift-extender/parser"
)

func main() {
	var extendedThriftDocument parser.Thrift
	var combinedThriftFile string
	var firstThriftFile string
	var secondThriftFile string

	firstThriftFile = "hive_metastore_2_3.thrift"
	secondThriftFile = "hive_metastore_3.thrift"
	flag.Parse()

	if flag.NArg() < 2 {
		log.Fatalf("Usage of %s: [options] firstThriftFile secondThriftFile combinedThriftFile\n", os.Args[0])
		flag.PrintDefaults()
		os.Exit(1)
	}

	firstThriftFile = flag.Arg(0)
	secondThriftFile = flag.Arg(1)
	if flag.Arg(2) != "" {
		combinedThriftFile = flag.Arg(2)
	}

	if flag.Arg(2) != "" {
		generator2.GenerateThriftIDLFile(combinedThriftFile, extendedThriftDocument)
	}

	parser2.ParseFiles(firstThriftFile, secondThriftFile, extendedThriftDocument)

}
