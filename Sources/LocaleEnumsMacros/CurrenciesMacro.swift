
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct CurrenciesMacro: MemberMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard declaration.is(EnumDeclSyntax.self) else {
            throw LocaleEnumsMacroError.notEnum
        }
        let currencies = Locale.Currency.isoCurrencies.map(\.identifier)
        let keywords = ["try"]
        var cases = ""
        for code in currencies {
            var param = code.lowercased()
            if keywords.contains(param) {
                param = "`\(param)`"
            }
            cases += "case \(param) = \"\(code)\"\n"
        }
        return [.init(stringLiteral: cases)]
    }
}
