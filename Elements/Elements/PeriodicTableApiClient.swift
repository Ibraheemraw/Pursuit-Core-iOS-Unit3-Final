//
//  PeriodicTableApiClient.swift
//  Elements
//
//  Created by Ibraheem rawlinson on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class PeriodicTableApiClient {
    static func searchForElementsInThePeriodicTable(completionHandler callBack: @escaping (AppError?, [PeriodicTableData]?) -> Void){
        NetworkHelper.shared.performDataTask(endpointURLString: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
            if let appError = appError {
                callBack(appError, nil)
            }
            guard let response = httpResponse, (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                callBack(AppError.badStatusCode(String(statusCode)), nil)
                return
            }
            if let data = data {
                do {
                    let periodicTableData = try JSONDecoder().decode([PeriodicTableData].self, from: data)
                    callBack(nil, periodicTableData)
                } catch {
                    callBack(AppError.decodingError(error), nil)
                }
            }
        }
    }
    static func sendElementMyFavorites(data: Data, callBack: @escaping (AppError?, Bool)-> Void){
        NetworkHelper.shared.performUploadTask(endpointURLString: "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites", httpMethod: "POST", httpBody: data) { (appError, data, httpResponse) in
            if let appError = appError {
                callBack(appError, false)
            }
            guard let response = httpResponse, (200...299).contains(response.statusCode) else {
                let statusCode = httpResponse?.statusCode ?? -999
                callBack(AppError.badStatusCode(String(statusCode)), false)
                return
            }
            //todo create a favoite and confirm favId
            if let _ = data {
                callBack(nil, true)
            }
        }
        
    }
}
