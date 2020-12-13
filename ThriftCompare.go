package main

import (
	"bufio"
	"flag"
	"fmt"
	"github.com/samuel/go-thrift/parser"
	"log"
	"os"
)

func addException(exception *parser.Struct) {
	extendedThriftDocument.Exceptions[exception.Name] = exception
}

func addStruct(struct_ *parser.Struct) {
	extendedThriftDocument.Structs[struct_.Name] = struct_
}
func addUnion(union *parser.Struct) {
	extendedThriftDocument.Unions[union.Name] = union
}

func addTypedef(typedef *parser.Typedef) {
	extendedThriftDocument.Typedefs[typedef.Name] = typedef
}

func addService(service *parser.Service) {
	extendedThriftDocument.Services[service.Name] = service
}

func addMethod(service *parser.Service, method *parser.Method) {
	extendedThriftDocument.Services[service.Name].Methods[method.Name] = method
}

func addConstant(constant *parser.Constant) {
	extendedThriftDocument.Constants[constant.Name] = constant
}

func addEnum(enum *parser.Enum) {
	extendedThriftDocument.Enums[enum.Name] = enum
}

func addNamespace(lang string, namespace string) {
	extendedThriftDocument.Namespaces[lang] = namespace
}

func addInclude(lang string, namespace string) {
	extendedThriftDocument.Includes[lang] = namespace
}

var extendedThriftDocument parser.Thrift
var combinedThriftFile string
var firstThriftFile string
var secondThriftFile string

func main() {

	firstThriftFile = "hive_metastore_2_3.thrift"
	secondThriftFile = "hive_metastore_3.thrift"
	flag.Parse()

	if flag.NArg() < 2 {
		fmt.Fprintf(os.Stderr, "Usage of %s: [options] firstThriftFile secondThriftFile combinedThriftFile\n", os.Args[0])
		flag.PrintDefaults()
		os.Exit(1)
	}

	firstThriftFile = flag.Arg(0)
	secondThriftFile = flag.Arg(1)
	if flag.Arg(2) != "" {
		combinedThriftFile = flag.Arg(2)
	}

	a, err := parser.ParseFile(firstThriftFile)
	if err != nil {
		fmt.Errorf("Some error while parsing file [%s] \n", err)
	}

	b, err := parser.ParseFile(secondThriftFile)
	if err != nil {
		fmt.Errorf("Some error while parsing file [%s] \n", err)
	}

	thriftDoc1 := a.(*parser.Thrift)
	thriftDoc2 := b.(*parser.Thrift)

	extendedThriftDocument = *thriftDoc2

	structs1 := thriftDoc1.Structs
	structs2 := thriftDoc2.Structs
	for _, structElement := range structs1 {
		existedStruct2 := structs2[structElement.Name]
		if existedStruct2 == nil {
			fmt.Printf("struct [%s] doesnt exists in file [%s]\n", structElement.Name, secondThriftFile)
			addStruct(structElement)
			continue
		}
	}

	unions1 := thriftDoc1.Unions
	unions2 := thriftDoc2.Unions
	for _, union := range unions1 {
		existedUnion2 := unions2[union.Name]
		if existedUnion2 == nil {
			fmt.Printf("union [%s] doesnt exists in file [%s]\n", union.Name, secondThriftFile)
			addUnion(union)
			continue
		}
	}
	types1 := thriftDoc1.Typedefs
	types2 := thriftDoc2.Typedefs
	for _, typeElement := range types1 {
		typedef := types2[typeElement.Name]
		if typedef == nil {
			fmt.Printf("typedef [%s] doesnt exists in file [%s]\n", typeElement.Name, secondThriftFile)
			addTypedef(typeElement)
			continue
		}
	}

	enums1 := thriftDoc1.Enums
	enums2 := thriftDoc2.Enums
	for _, enumElement := range enums1 {
		enum := enums2[enumElement.Name]
		if enum == nil {
			fmt.Printf("enum [%s] doesnt exists in file [%s]\n", enumElement.Name, secondThriftFile)
			addEnum(enumElement)
			continue
		}
	}

	exceptions1 := thriftDoc1.Exceptions
	exceptions2 := thriftDoc2.Exceptions
	for _, exceptionElement := range exceptions1 {
		existedException2 := exceptions2[exceptionElement.Name]
		if existedException2 == nil {
			fmt.Printf("exception [%s] doesnt exists in file [%s]\n", exceptionElement.Name, secondThriftFile)
			addException(exceptionElement)
			continue
		}
	}

	services1 := thriftDoc1.Services
	services2 := thriftDoc2.Services
	for _, serviceElement := range services1 {
		existedService2 := services2[serviceElement.Name]
		if existedService2 == nil {
			fmt.Printf("service [%s] doesnt exists in file [%s]\n", serviceElement.Name, secondThriftFile)
			addService(serviceElement)
			continue
		}
		methods := serviceElement.Methods
		for _, method := range methods {
			existedMethod := existedService2.Methods[method.Name]
			if existedMethod == nil {
				fmt.Printf("method [%s]->[%s] doesnt exists in file [%s]\n", serviceElement.Name, method.Name, secondThriftFile)
				addMethod(serviceElement, method)
				continue
			}
		}
	}

	constants1 := thriftDoc1.Constants
	constants2 := thriftDoc2.Constants
	for _, constantElement := range constants1 {
		existedConstant2 := constants2[constantElement.Name]
		if existedConstant2 == nil {
			fmt.Printf("constant [%s] doesnt exists in file [%s]\n", constantElement.Name, secondThriftFile)
			addConstant(constantElement)
			continue
		}
	}

	includes1 := thriftDoc1.Includes
	includes2 := thriftDoc2.Includes
	for i, includeElement := range includes1 {
		includeExisted := includes2[i]
		if len(includeExisted) == 0 {
			fmt.Printf("includeExisted [%s] doesnt exists in file [%s]\n", includeElement, secondThriftFile)
			addInclude(i, includeElement)
			continue
		}
	}

	namespace1 := thriftDoc1.Namespaces
	namespace2 := thriftDoc2.Namespaces
	for lang := range namespace1 {
		existedNamespace := namespace2[lang]
		if len(existedNamespace) == 0 {
			fmt.Printf("namespace [%s]->[%s] doesnt exists in file [%s]\n", lang, existedNamespace, secondThriftFile)
			addNamespace(lang, existedNamespace)
			continue
		}
	}

	if flag.Arg(2) != "" {
		generateThriftIDLFile(combinedThriftFile, extendedThriftDocument)
	}
}

func generateThriftIDLFile(filename string, thrift parser.Thrift) {
	file, err := os.Create(filename)
	if err != nil {
		log.Fatal(err)
	}

	writer := bufio.NewWriter(file)
	for _, include := range thrift.Includes {
		_, err := writer.WriteString(fmt.Sprintf("include \"%s\" \n", include))
		if err != nil {
			log.Fatalf("Got error while writing to a file. Err: %s", err.Error())
		}
	}
	writer.WriteString("\n")
	for lang, namespace := range thrift.Namespaces {
		_, err := writer.WriteString(fmt.Sprintf("namespace %s %s \n", lang, namespace))
		if err != nil {
			log.Fatalf("Got error while writing to a file. Err: %s", err.Error())
		}
	}
	writer.WriteString("\n")
	for _, constant := range thrift.Constants {
		var fieldStr string
		if constant.Type.String() == "byte" {
			fieldStr = fmt.Sprintf("const %s %s = %d \n", "i8", constant.Name, constant.Value)
		} else {
			fieldStr = fmt.Sprintf("const %s %s = \"%s\" \n", constant.Type.String(), constant.Name, constant.Value)
		}
		_, _ = writer.WriteString(fieldStr)
		if err != nil {
			log.Fatalf("Got error while writing to a file. Err: %s", err.Error())
		}
	}
	writer.WriteString("\n")

	for _, structElem := range thrift.Structs {
		_, _ = writer.WriteString(fmt.Sprintf("struct %s { \n", structElem.Name))
		for _, field := range structElem.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field),formatType(*field.Type), field.Name)
			_, _ = writer.WriteString(fieldStr)
		}
		_, _ = writer.WriteString("} \n")
		writer.WriteString("\n")

	}

	for _, exception := range thrift.Unions {
		_, _ = writer.WriteString(fmt.Sprintf("union %s { \n", exception.Name))
		for _, field := range exception.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field),formatType(*field.Type), field.Name)
			_, _ = writer.WriteString(fieldStr)
		}
		_, _ = writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	for _, enum := range thrift.Enums {
		_, _ = writer.WriteString(fmt.Sprintf("enum %s { \n", enum.Name))
		for _, value := range enum.Values {
			_, _ = writer.WriteString(fmt.Sprintf("\t%s = %d \n", value.Name, value.Value))
		}
		_, _ = writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	writer.WriteString("\n")
	for _, exception := range thrift.Exceptions {
		_, _ = writer.WriteString(fmt.Sprintf("exception %s { \n", exception.Name))
		for _, field := range exception.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field), formatType(*field.Type), field.Name)
			_, _ = writer.WriteString(fieldStr)
		}
		_, _ = writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	writer.WriteString("\n")
	for _, service := range thrift.Services {
		_, _ = writer.WriteString(fmt.Sprintf("service %s extends %s { \n", service.Name, service.Extends))
		for _, method := range service.Methods {
			var methodSignature string
			methodSignature = fmt.Sprintf("\t%s %s ", formatReturnType(method), method.Name)
			methodSignature += "("
			for i, argument := range method.Arguments {
				if i != 0 {
					methodSignature += ", "
				}
				methodSignature += fmt.Sprintf("%d: %s %s", argument.ID, argument.Type.String(), argument.Name)

			}
			methodSignature += ")"
			if len(method.Exceptions) != 0 {
				methodSignature += fmt.Sprintf(" throws ")
				methodSignature += "("

				for i, exception := range method.Exceptions {
					if i != 0 {
						methodSignature += ", "
					}
					methodSignature += fmt.Sprintf("%d: %s %s", exception.ID, exception.Type.String(), exception.Name)
				}
				methodSignature += ")"

			}
			_, _ = writer.WriteString(methodSignature)
			_, _ = writer.WriteString("\n")

		}
		_, _ = writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	writer.Flush()
}

func formatReturnType(method *parser.Method) string {
	var returnType string
	if method.ReturnType == nil {
		returnType = "void"
	} else {
		returnType = method.ReturnType.String()
	}
	return returnType
}


func formatType(p parser.Type) string {
	if p.String() == "byte" {
		return "i8"
	} else {
		return p.String()
	}
}

func formatOptional(field *parser.Field) string {
	if field.Optional {
		return "optional"
	} else {
		return "required"
	}
}


