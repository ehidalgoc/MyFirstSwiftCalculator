//
//  main.swift
//  CalculatorSwift
//
//  Created by BPIMA_ALW1090 on 12/3/24.
//

import Foundation

repeat{
    
    //Ask the user what operation they want to perform.
    print("\n\n\n----------------------------------------------")
    print("\nMySwiftCalculator\n")
    print("What operation do you want to perform?\n\n1.Add\n2.Subtract\n3.Multiply\n4.Divide\n\nEnter the number related to the operation you want to execute: ", terminator: "")
    guard let operation = readLine(), ["1", "2", "3", "4"].contains(operation) else {
        print("Invalid Operation")
        continue
    }
    
    //default value when the action like sumar, restar, could be nil
    let process = "process"
    
    //default value when the value symbol could be nil
    let defectSymbol = "..."
    
    //get the operation name, example: 1 = sumar, 2 = restar
    let action = obtainTheOperationValue(operation, "1");
    
    //get the operation symbol, example 1 = +, 2 = -
    let symbolOperation = obtainTheOperationValue(operation, "2")
    
    //read the firstValue
    let num1 = methodReadTheTerminalValue(withMessage: "Enter the first value to \(action ?? process): ")

    //read the secondValue
    let num2 = methodReadTheTerminalValue(withMessage: "Enter the first value to \(action ?? process): ")
    

    //calculate the operation selected by the user
    if let result = calculate(operation, num1, num2) {
        print("The result when executing the operation [ \(num1) \(symbolOperation ?? defectSymbol) \(num2) ] is: \(result)")
    } else {
        print("Error: Cannot divide by zero")
    }
    
    
    if !askingTheUserToContinueMakingOperations(){
        break;
    }
    

} while true



func calculate(_ operation: String, _ num1: Double, _ num2: Double) -> Double? {
    switch operation {
    case "1":
        return num1 + num2
    case "2":
        return num1 - num2
    case "3":
        return num1 * num2
    case "4":
        return num2 != 0 ? num1 / num2 : nil
    default:
        return nil
    }
}

func obtainTheOperationValue(_ operation: String,_ action: String ) -> String? {
    
    var returnValue = ""
    
    switch operation {
    case "1":
        
        if(action == "1"){
            returnValue = "add"
        } else {
            returnValue = "+"
        }
    case "2":
        
        if(action == "1"){
            returnValue = "substract"
        } else{
            returnValue = "-"
        }
    case "3":
        
        if(action == "1"){
            returnValue = "multiply"
        }else{
            returnValue = "*"
        }
    case "4":
        
        if(action == "1"){
            returnValue = "divide"
        }else{
            returnValue = "/"
        }
    default:
        returnValue = "undefined operation"
    }
    
    return returnValue
}

func methodReadTheTerminalValue(withMessage message: String) -> Double {
    while true {
        print(message, terminator: "")
        if let input = readLine(), let number = Double(input) {
            return number
        } else {
            print("Invalid input. Please enter a valid number.")
        }
    }
}


func askingTheUserToContinueMakingOperations()-> Bool {
    
    var continueOperations: Bool = true
    while true {
        print("Do you want to continue doing more operations? (yes/no): ", terminator: "")
        guard let response = readLine()?.lowercased() else {
            print("Invalid input. Please type 'yes' or 'no'.")
            continue
        }
        
        if response == "yes" {
            // Continue the operations
            break
        } else if response == "no" {
            print("Thank you very much for using this calculator!")
            continueOperations = false
            break
        
        } else {
            print("Invalid response. Please enter 'yes' or 'no'.")
        }
    }
    
    return continueOperations
}


