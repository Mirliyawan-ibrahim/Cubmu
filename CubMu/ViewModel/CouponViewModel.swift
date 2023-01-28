//
//  CouponViewModel.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import Foundation

class CouponViewModel: ObservableObject {
    
    @Published public var successRequest: (() -> ())?
    @Published public var failureRequest: (() -> ())?
    @Published public var dataCoupon: [Results] = []
    @Published public var dataCouponSearch: [Results] = []
    @Published public var message: String? = ""
   
  
    public func getCoupon() {
        CouponService.shareInstance.getCoupun { [weak self] (result, message, data) in
            switch result {
            case .success(_):
                self?.dataCoupon = data?.result ?? []
                self?.message = message
                self?.successRequest?()
                break
            case .failure(_):
                self?.message = message
                self?.failureRequest?()
                break
            }
        }
    }
}
