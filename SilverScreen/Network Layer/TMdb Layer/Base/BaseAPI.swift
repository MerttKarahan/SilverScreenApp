//
//  BaseAPI.swift
//  SilverScreen
//
//  Created by Karahan, Mert on 15.10.2023.
//

import Foundation
import Alamofire

class BaseAPI {

    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestWithoutParams:
            return ([:], URLEncoding.default)
        case .requestWithParams(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }

    func fetchData<M: Decodable>(target: TargetType, completionHandler: @escaping (Result<M, NSError>) -> Void) {
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let buildParams = buildParams(task: target.task)
        var parameters = buildParams.0
        parameters["api_key"] = Constants.apiKey

        AF.request(target.baseURL + target.path, method: target.method, parameters: parameters, encoding: buildParams.1, headers: headers).responseDecodable { (response: AFDataResponse<M>) in

            if let value = response.value {
                completionHandler(.success(value))
            } else if let error = response.error {
                completionHandler(.failure(NSError()))
            }
        }
    }
}
