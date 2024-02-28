//
//  APIServiceManager.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 27/02/24.
//

import Foundation

class APIManager
{
    private let session = URLSession.shared
    static let shared = APIManager()

    func getDataFromServer(
        endPoints: APIEndpoints,
        completion: @escaping(
            _ responseDate: Data?,
            _ error: NSError?,
            _ statusCode: Int?
        ) -> Void) {

            let task = self.session.dataTask(
                with: endPoints.urlRequest,
                completionHandler: { data, response, error -> Void in

                    if error == nil {
                        completion(data, nil, (response as? HTTPURLResponse)?.statusCode)
                    }
                    else {
                        completion(nil, error as NSError?, (response as? HTTPURLResponse)?.statusCode)
                    }
                })
            task.resume()
        }
}

enum APIEndpoints
{
    case getUserList
    case createNewUser(model: UserModel)
}

public protocol APIConfigurations {
    var baseURL: String { get }
    var path: String { get }
    var urlRequest: URLRequest { get }
    var body: Data { get }
}

extension APIEndpoints: APIConfigurations
{
    var body: Data {
        switch self {
        case .getUserList:
            return Data()
        case .createNewUser(model: let userModel):
            guard let jsonBody = self.modelToEncodedData(modelObj: userModel) else {
                return Data()
            }
            return jsonBody
        }
    }
    
    var token: String {
        return "Bearer 9c993a5c912747b4fb6bccc389e796ebc2f06b165361098fec291e49f2e928dd"
    }

    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: URL(string: path)!)
        switch self {
        case .getUserList:
            urlRequest.httpMethod = "GET"
        case .createNewUser(model: ):
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = body
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        
        return urlRequest as URLRequest
    }

    var baseURL: String {
        "https://gorest.co.in"
    }

    var path: String {
        switch self {
        case .getUserList, .createNewUser(model: _):
            return baseURL + "/public/v2/users"
        }
    }

    private func modelToEncodedData<Value>(modelObj: Value) -> Data? where Value : Encodable {
        do {
            let apiServiceResponseJson = try JSONEncoder().encode(modelObj)
            return apiServiceResponseJson
        } catch _ {
            return nil
        }
    }
}

public extension Data
{
    func dataParser<ModelClass:Codable>(dataToModel:ModelClass.Type)->ModelClass?{
        do {
            let apiServiceResponseJson = try JSONDecoder().decode(dataToModel, from: self)
            return apiServiceResponseJson
        } catch _ {
            return nil
        }
    }
}
