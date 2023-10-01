import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct LocaleEnumsPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        CountriesMacro.self,
        CurrenciesMacro.self
    ]
}

public enum LocaleEnumsMacroError: CustomStringConvertible, Error {
    case notEnum
    
    public var description: String {
        switch self {
        case .notEnum:
            "Only enums can adopt this macro"
        }
    }
}
