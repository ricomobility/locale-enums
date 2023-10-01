
@attached(member, names: arbitrary)
public macro Countries() = #externalMacro(module: "LocaleEnumsMacros", type: "CountriesMacro")

@attached(member, names: arbitrary)
public macro Currencies() = #externalMacro(module: "LocaleEnumsMacros", type: "CurrenciesMacro")
