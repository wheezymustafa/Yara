//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Classify Grocery Product Bulk

    Provide a set of product jsons, get back classified products.
    */
    public enum ClassifyGroceryProductBulk {

        public static let service = APIService<Response>(id: "classifyGroceryProductBulk", tag: "", method: "POST", path: "/food/products/classifyBatch", hasBody: true, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The display name of the returned category, supported is en_US (for American English) and en_GB (for British English). */
                public var locale: String?

                public init(locale: String? = nil) {
                    self.locale = locale
                }
            }

            public var options: Options

            public var body: [Any]

            public init(body: [Any], options: Options, encoder: RequestEncoder? = nil) {
                self.body = body
                self.options = options
                super.init(service: ClassifyGroceryProductBulk.service) { defaultEncoder in
                    return try (encoder ?? defaultEncoder).encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(locale: String? = nil, body: [Any]) {
                let options = Options(locale: locale)
                self.init(body: body, options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                if let locale = options.locale {
                  params["locale"] = locale
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
