//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Visualize Recipe Nutrition by ID

    Visualize a recipe's nutritional information as HTML including CSS.
    */
    public enum VisualizeRecipeNutritionByID {

        public static let service = APIService<Response>(id: "visualizeRecipeNutritionByID", tag: "", method: "GET", path: "/recipes/{id}/nutritionWidget", hasBody: false, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The recipe id. */
                public var id: Double

                /** Whether the default CSS should be added to the response. */
                public var defaultCss: Bool?

                public init(id: Double, defaultCss: Bool? = nil) {
                    self.id = id
                    self.defaultCss = defaultCss
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: VisualizeRecipeNutritionByID.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: Double, defaultCss: Bool? = nil) {
                let options = Options(id: id, defaultCss: defaultCss)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let defaultCss = options.defaultCss {
                  params["defaultCss"] = defaultCss
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = String

            /** Success */
            case status200(String)

            /** Unauthorized */
            case status401

            /** Forbidden */
            case status403

            /** Not Found */
            case status404

            public var success: String? {
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
                case 200: self = try .status200(decoder.decode(String.self, from: data))
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
