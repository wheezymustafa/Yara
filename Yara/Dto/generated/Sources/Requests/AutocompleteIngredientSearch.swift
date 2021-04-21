//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Autocomplete Ingredient Search

    Autocomplete the entry of an ingredient.
    */
    public enum AutocompleteIngredientSearch {

        public static let service = APIService<Response>(id: "autocompleteIngredientSearch", tag: "", method: "GET", path: "/food/ingredients/autocomplete", hasBody: false, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The partial or full ingredient name. */
                public var query: String

                /** The number of results to return (between 1 and 100). */
                public var number: Double?

                /** Whether to return more meta information about the ingredients. */
                public var metaInformation: Bool?

                /** A comma-separated list of intolerances. All recipes returned must not contain ingredients that are not suitable for people with the intolerances entered. See a full list of supported intolerances. */
                public var intolerances: String?

                public init(query: String, number: Double? = nil, metaInformation: Bool? = nil, intolerances: String? = nil) {
                    self.query = query
                    self.number = number
                    self.metaInformation = metaInformation
                    self.intolerances = intolerances
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: AutocompleteIngredientSearch.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(query: String, number: Double? = nil, metaInformation: Bool? = nil, intolerances: String? = nil) {
                let options = Options(query: query, number: number, metaInformation: metaInformation, intolerances: intolerances)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["query"] = options.query
                if let number = options.number {
                  params["number"] = number
                }
                if let metaInformation = options.metaInformation {
                  params["metaInformation"] = metaInformation
                }
                if let intolerances = options.intolerances {
                  params["intolerances"] = intolerances
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [String: Any]

            /** Success */
            case status200([String: Any])

            /** Unauthorized */
            case status401

            /** Forbidden */
            case status403

            /** Not Found */
            case status404

            public var success: [String: Any]? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status401: return 401
                case .status403: return 403
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status401: return false
                case .status403: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decodeAny([String: Any].self, from: data))
                case 401: self = .status401
                case 403: self = .status403
                case 404: self = .status404
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
