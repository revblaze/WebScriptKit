//
//  TypeSwift.swift
//  SingleView
//
//  Created by Justin Bush on 11/17/21.
//

import WebKit

protocol CustomJavaScriptConvertible {
  var asJavaScript: String { get }
}

extension RawRepresentable where RawValue: CustomJavaScriptConvertible {
  var rawValue: String {
    return "\(self)"
  }
  
  var asJavaScript: String {
    return ""
  }
}


enum TypeSwift: CustomJavaScriptConvertible {
  var asJavaScript: String {
    switch self {
    case .voidFunc: return "voidFunction();"
    case let .boolFunc(a): return "boolFunction(\(a));"
    case .clickButton(let n): return "clickButton(\(n.id));"
    }
  }
  
  
  case voidFunc //case voidFunc(_ : Void)
  case boolFunc(Bool)
  case clickButton(AuthButtons)
  
  enum AuthButtons: CustomJavaScriptConvertible {
    var asJavaScript: String { "AuthButtons.\(self)" }
    
    case login, register, cancel
    var id: String { return "AuthButtons.\(self)" }
  }
}

// MARK: Raw JavaScript -
extension TypeSwift {
  
  var js: String {
    switch self {
    case .voidFunc: return "voidFunction();"
    case .boolFunc(let n): return "boolFunction(\(n));"
    case .clickButton(let n): return "clickButton(\(n.id));"
    }
  }
}

extension WKWebView {
  func js(_ script: TypeSwift) { evaluateJavaScript(script.js) }
}

protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

enum ExampleEnum : ExampleProtocol {
  case Base, Adjusted
  
  var simpleDescription: String {
    return self.getDescription()
  }
  
  func getDescription() -> String {
    switch self {
    case .Base:
      return "A simple description of enum"
    case .Adjusted:
      return "Adjusted description of enum"
    }
  }
  
  mutating func adjust() {
    self = ExampleEnum.Adjusted
  }
}

var c = ExampleEnum.Base
//c.adjust()
let cDescription = c.simpleDescription
