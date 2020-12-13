package parser

import (
	"github.com/samuel/go-thrift/parser"
	"log"
)

func ParseFiles(firstThriftFile string, secondThriftFile string, extendedThriftDocument parser.Thrift) {
	a, err := parser.ParseFile(firstThriftFile)
	if err != nil {
		log.Fatalf("Some error while parsing file [%s] \n", err)
	}

	b, err := parser.ParseFile(secondThriftFile)
	if err != nil {
		log.Fatalf("Some error while parsing file [%s] \n", err)
	}

	thriftDoc1 := a.(*parser.Thrift)
	thriftDoc2 := b.(*parser.Thrift)

	extendedThriftDocument = *thriftDoc2

	structs1 := thriftDoc1.Structs
	structs2 := thriftDoc2.Structs
	for _, structElement := range structs1 {
		existedStruct := structs2[structElement.Name]
		if existedStruct == nil {
			log.Printf("struct [%s] doesnt exists in file [%s]\n", structElement.Name, secondThriftFile)
			extendedThriftDocument.Structs[structElement.Name] = structElement
			log.Printf("Add missing struct %s", structElement.Name)
			continue
		}
	}

	unions1 := thriftDoc1.Unions
	unions2 := thriftDoc2.Unions
	for _, unionElement := range unions1 {
		existedUnion := unions2[unionElement.Name]
		if existedUnion == nil {
			log.Printf("unionElement [%s] doesnt exists in file [%s]\n", unionElement.Name, secondThriftFile)
			extendedThriftDocument.Unions[unionElement.Name] = existedUnion
			log.Printf("Add missing union %s", unionElement.Name)
			continue
		}
	}
	types1 := thriftDoc1.Typedefs
	types2 := thriftDoc2.Typedefs
	for _, typeElement := range types1 {
		existedTypedef := types2[typeElement.Name]
		if existedTypedef == nil {
			log.Printf("existedTypedef [%s] doesnt exists in file [%s]\n", typeElement.Name, secondThriftFile)
			extendedThriftDocument.Typedefs[typeElement.Name] = typeElement
			log.Printf("Add missing typedef %s", typeElement.Name)
			continue
		}
	}

	enums1 := thriftDoc1.Enums
	enums2 := thriftDoc2.Enums
	for _, enumElement := range enums1 {
		existedEnum := enums2[enumElement.Name]
		if existedEnum == nil {
			log.Printf("existedEnum [%s] doesnt exists in file [%s]\n", enumElement.Name, secondThriftFile)
			extendedThriftDocument.Enums[enumElement.Name] = enumElement
			log.Printf("Add missing enum %s", enumElement.Name)
			continue
		}
	}

	exceptions1 := thriftDoc1.Exceptions
	exceptions2 := thriftDoc2.Exceptions
	for _, exceptionElement := range exceptions1 {
		existedException := exceptions2[exceptionElement.Name]
		if existedException == nil {
			log.Printf("exception [%s] doesnt exists in file [%s]\n", exceptionElement.Name, secondThriftFile)
			extendedThriftDocument.Exceptions[exceptionElement.Name] = exceptionElement
			log.Printf("Add missing exception %s", exceptionElement.Name)
			continue
		}
	}

	services1 := thriftDoc1.Services
	services2 := thriftDoc2.Services
	for _, serviceElement := range services1 {
		existedService := services2[serviceElement.Name]
		if existedService == nil {
			log.Printf("service [%s] doesnt exists in file [%s]\n", serviceElement.Name, secondThriftFile)
			extendedThriftDocument.Services[serviceElement.Name] = serviceElement
			log.Printf("Add missing service %s", serviceElement.Name)
			continue
		}
		methods := serviceElement.Methods
		for _, methodElement := range methods {
			existedMethod := existedService.Methods[methodElement.Name]
			if existedMethod == nil {
				log.Printf("methodElement [%s]->[%s] doesnt exists in file [%s]\n", serviceElement.Name, methodElement.Name, secondThriftFile)
				extendedThriftDocument.Services[serviceElement.Name].Methods[methodElement.Name] = methodElement
				log.Printf("Add missing method %s -> %s", serviceElement.Name, methodElement.Name)
				continue
			}
		}
	}

	constants1 := thriftDoc1.Constants
	constants2 := thriftDoc2.Constants
	for _, constantElement := range constants1 {
		existedConstant := constants2[constantElement.Name]
		if existedConstant == nil {
			log.Printf("constant [%s] doesnt exists in file [%s]\n", constantElement.Name, secondThriftFile)
			extendedThriftDocument.Constants[constantElement.Name] = constantElement
			log.Printf("Add missing constant %s", constantElement.Name)
			continue
		}
	}

	includes1 := thriftDoc1.Includes
	includes2 := thriftDoc2.Includes
	for i, includeElement := range includes1 {
		existedInclude := includes2[i]
		if len(existedInclude) == 0 {
			log.Printf("existedInclude [%s] doesnt exists in file [%s]\n", includeElement, secondThriftFile)
			extendedThriftDocument.Includes[i] = includeElement
			log.Printf("Add missing Includes %s", includeElement)
			continue
		}
	}

	namespace1 := thriftDoc1.Namespaces
	namespace2 := thriftDoc2.Namespaces
	for lang, namespace := range namespace1 {
		existedNamespace := namespace2[lang]
		if len(existedNamespace) == 0 {
			log.Printf("namespace [%s]->[%s] doesnt exists in file [%s]\n", lang, existedNamespace, secondThriftFile)
			extendedThriftDocument.Namespaces[lang] = namespace
			log.Printf("Add missing namespace %s", namespace)
			continue
		}
	}

}
