//
//  URLRequest+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 14/04/2022.
//

#if !os(macOS)
import Environment
import Foundation

/// Utility extension for `URLRequest`.
public extension URLRequest {
    /// Set the value client-api-token HTTPHeaderField.
    mutating func setLinkClientApiToken() {
        setValue(Environment.current.link.apiToken, forHTTPHeaderField: HeaderField.linkClientApiToken)
    }
    
    /// Set the value of id-token HTTPHeaderField.
    mutating func setLinkIdToken(_ idToken: String) {
        setValue(idToken, forHTTPHeaderField: HeaderField.linkTokenId)
        setValue(Environment.current.reachFive.client, forHTTPHeaderField: HeaderField.linkClientId)
    }
    
    /// Set the value of Authorization HTTPHeaderField.
    ///
    /// - Parameters:
    ///    - authorization: The `HeaderFieldAuthorization` of  HTTPHeaderField
    mutating func setAuthorization(_ authorization: HeaderFieldAuthorization) {
        setValue(authorization.headerValue, forHTTPHeaderField: HeaderField.authorization)
    }
    
    /// Set the value of Content-Type HTTPHeaderField.
    ///
    /// - Parameters:
    ///    - contentType: The `ContentType` of  HTTPHeaderField
    mutating func setContentType(_ contentType: ContentType) {
        setValue(contentType.headerValue, forHTTPHeaderField: ContentType.httpHeaderField)
    }

    enum ContentType {
        case json
        case xWWWFormUrlEncoded

        static let httpHeaderField = "Content-Type"

        var headerValue: String {
            switch self {
            case .json:
                return "application/json"
            case .xWWWFormUrlEncoded:
                return "application/x-www-form-urlencoded"
            }
        }
    }
}
#endif
