//
//  CoupunService.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import Foundation
import Alamofire
import SwiftyJSON

class CouponService: NSObject {
    static let shareInstance = CouponService()
    public func getCoupun(completion: @escaping(Result<Bool, ErrorsApi>, String?, CouponModel?) -> ()) {
        AF.request(CouponAPI.URL_GET_COUPON,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success:
                let json = JSON(response.value as Any)
                print(json)
                if response.response?.statusCode == 200 {
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        do {
                            let datadecoder = try decoder.decode(CouponModel.self, from: data)
                            completion(.success(true), "", datadecoder)
                        } catch {
                            var message: String?
                            if let message_ = json["message"].string {
                                message = message_
                            } else {
                                message = "Mohon maaf data tidak ditemukan"
                            }
                            completion(.failure(ErrorsApi.errorData), message, nil)
                        }
                    }
                } else {
                    let json = JSON(response.value as Any)
                    var message: String?
                    if let message_ = json["message"].string {
                        message = message_
                    }else{
                        message = "Terjadi Kesalahan data"
                    }
                    completion(.failure(ErrorsApi.errorData), message, nil)
                }
                
            case .failure:
                let json = JSON(response.value as Any)
                var message: String?
                if let message_ = json["message"].string {
                    message = message_
                }else{
                    message = "Tidak dapat terhubung ke Server"
                }
                completion(.failure(ErrorsApi.errorServer), message, nil)
            }
        }
    }
}

