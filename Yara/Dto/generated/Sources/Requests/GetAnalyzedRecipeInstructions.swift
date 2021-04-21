//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Get Analyzed Recipe Instructions

    Get an analyzed breakdown of a recipe's instructions. Each step is enriched with the ingredients and equipment required.
    */
    public enum GetAnalyzedRecipeInstructions {

        public static let service = APIService<Response>(id: "getAnalyzedRecipeInstructions", tag: "", method: "GET", path: "/recipes/{id}/analyzedInstructions", hasBody: false, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The recipe id. */
                public var id: Double

                /** Whether to break down the recipe steps even more. */
                public var stepBreakdown: Bool?

                public init(id: Double, stepBreakdown: Bool? = nil) {
                    self.id = id
                    self.stepBreakdown = stepBreakdown
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetAnalyzedRecipeInstructions.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: Double, stepBreakdown: Bool? = nil) {
                let options = Options(id: id, stepBreakdown: stepBreakdown)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let stepBreakdown = options.stepBreakdown {
                  params["stepBreakdown"] = stepBreakdown
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
