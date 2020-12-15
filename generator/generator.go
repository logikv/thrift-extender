package generator

import (
	"bufio"
	"fmt"
	"github.com/samuel/go-thrift/parser"
	"log"
	"os"
)

func GenerateThriftIDLFile(filename string, thrift *parser.Thrift) {
	file, err := os.Create(filename)
	if err != nil {
		log.Fatal(err)
	}

	writer := bufio.NewWriter(file)
	for _, include := range thrift.Includes {
		writer.WriteString(fmt.Sprintf("include \"%s\" \n", include))
	}
	writer.WriteString("\n")
	for lang, namespace := range thrift.Namespaces {
		writer.WriteString(fmt.Sprintf("namespace %s %s \n", lang, namespace))
	}
	writer.WriteString("\n")
	for _, constant := range thrift.Constants {
		fieldStr := fmt.Sprintf("const %s %s = %s \n", formatType(*constant.Type), constant.Name, formatConstantValue(constant))
		writer.WriteString(fieldStr)
	}
	writer.WriteString("\n")

	for _, structElem := range thrift.Structs {
		writer.WriteString(fmt.Sprintf("struct %s { \n", structElem.Name))
		for _, field := range structElem.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field), formatType(*field.Type), field.Name)
			writer.WriteString(fieldStr)
		}
		writer.WriteString("} \n")
		writer.WriteString("\n")

	}

	for _, exception := range thrift.Unions {
		writer.WriteString(fmt.Sprintf("union %s { \n", exception.Name))
		for _, field := range exception.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field), formatType(*field.Type), field.Name)
			writer.WriteString(fieldStr)
		}
		writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	for _, enum := range thrift.Enums {
		writer.WriteString(fmt.Sprintf("enum %s { \n", enum.Name))
		for _, value := range enum.Values {
			writer.WriteString(fmt.Sprintf("\t%s = %d \n", value.Name, value.Value))
		}
		writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	writer.WriteString("\n")
	for _, exception := range thrift.Exceptions {
		writer.WriteString(fmt.Sprintf("exception %s { \n", exception.Name))
		for _, field := range exception.Fields {
			fieldStr := fmt.Sprintf("\t%d: %s %s %s \n", field.ID, formatOptional(field), formatType(*field.Type), field.Name)
			writer.WriteString(fieldStr)
		}
		writer.WriteString("} \n")
		writer.WriteString("\n")
	}
	writer.WriteString("\n")

	writer.WriteString("\n")
	for _, service := range thrift.Services {
		writer.WriteString(fmt.Sprintf("service %s extends %s { \n", service.Name, service.Extends))
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
			writer.WriteString(methodSignature)
			writer.WriteString("\n")

		}
		writer.WriteString("} \n")
	}

	writer.WriteString("\n")

	writer.Flush()
}

func formatConstantValue(constant *parser.Constant) string {
	var valueStr string
	if constant.Type.String() == "byte" {
		valueStr = fmt.Sprintf("%d", constant.Value)
	} else {
		valueStr = fmt.Sprintf("%s", constant.Value)
	}
	return valueStr
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
