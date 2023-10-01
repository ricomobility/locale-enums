
import Foundation
import LocaleEnums

@Countries
enum Country: String, Codable {
    case unknown
}
let country = Country.cy
print(country)

@Currencies
enum Currency: String, Codable {
    case unknown
}
