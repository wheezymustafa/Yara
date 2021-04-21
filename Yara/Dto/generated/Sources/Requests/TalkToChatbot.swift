//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /**
    Talk to Chatbot

    This endpoint can be used to have a conversation about food with the spoonacular chatbot. Use the "Get Conversation Suggests" endpoint to show your user what he or she can say.
    */
    public enum TalkToChatbot {

        public static let service = APIService<Response>(id: "talkToChatbot", tag: "", method: "GET", path: "/food/converse", hasBody: false, securityRequirements: [SecurityRequirement(type: "apiKeyScheme", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The request / question / answer from the user to the chatbot. */
                public var text: String

                /** An arbitrary globally unique id for your conversation. The conversation can contain states so you should pass your context id if you want the bot to be able to remember the conversation. */
                public var contextId: String?

                public init(text: String, contextId: String? = nil) {
                    self.text = text
                    self.contextId = contextId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: TalkToChatbot.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(text: String, contextId: String? = nil) {
                let options = Options(text: text, contextId: contextId)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["text"] = options.text
                if let contextId = options.contextId {
                  params["contextId"] = contextId
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
