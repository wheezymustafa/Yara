//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Parse Ingredients

    Extract an ingredient from plain text.
    */
    public enum ParseIngredients {

        public static let service = APIService<Response>(id: "parseIngredients", tag: "", method: "POST", path: "/recipes/parseIngredients", hasBody: true, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The ingredient list of the recipe, one ingredient per line. */
                public var ingredientList: String

                /** The number of servings that you can make from the ingredients. */
                public var servings: Double

                /** Whether nutrition data should be added to correctly parsed ingredients. */
                public var includeNutrition: Bool?

                public init(ingredientList: String, servings: Double, includeNutrition: Bool? = nil) {
                    self.ingredientList = ingredientList
                    self.servings = servings
                    self.includeNutrition = includeNutrition
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: ParseIngredients.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(ingredientList: String, servings: Double, includeNutrition: Bool? = nil) {
                let options = Options(ingredientList: ingredientList, servings: servings, includeNutrition: includeNutrition)
                self.init(options: options)
            }

            public override var formParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["ingredientList"] = options.ingredientList
                params["servings"] = options.servings
                if let includeNutrition = options.includeNutrition {
                  params["includeNutrition"] = includeNutrition
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
