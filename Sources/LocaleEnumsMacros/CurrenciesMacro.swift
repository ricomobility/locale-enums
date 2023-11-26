
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct CurrenciesMacro: MemberMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax, in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        guard declaration.is(EnumDeclSyntax.self) else {
            throw LocaleEnumsMacroError.notEnum
        }
        let currencies = Locale.isoCurrencies
        let keywords = ["try"]
        var cases: [EnumCaseDeclSyntax] = []
        for code in currencies {
            var param = code.lowercased()
            if keywords.contains(param) {
                param = "`\(param)`"
            }
            let element = EnumCaseElementSyntax(
                name: .identifier(param),
                rawValue: .init(
                    value: StringLiteralExprSyntax(content: code)
                )
            )
            cases.append(
                EnumCaseDeclSyntax(
                    elements: EnumCaseElementListSyntax([element])
                )
            )
        }
        return cases.map(DeclSyntax.init)
    }
}
