package main

import (
	"flag"
	"log"
	"os"
	generator2 "thrift-extender/generator"
	parser2 "thrift-extender/parser"
)

func main() {
	var combinedThriftFile string
	var firstThriftFile string
	var secondThriftFile string

	flag.Parse()

	if flag.NArg() < 2 {
		flag.PrintDefaults()
		log.Fatalf("Usage of %s: [options] firstThriftFile secondThriftFile combinedThriftFile\n", os.Args[0])
	}

	firstThriftFile = flag.Arg(0)
	secondThriftFile = flag.Arg(1)
	if flag.Arg(2) != "" {
		combinedThriftFile = flag.Arg(2)
	}

	extendedThriftDocument := parser2.ParseFiles(firstThriftFile, secondThriftFile)

	if flag.Arg(2) != "" {
		generator2.GenerateThriftIDLFile(combinedThriftFile, extendedThriftDocument)
	}

}
