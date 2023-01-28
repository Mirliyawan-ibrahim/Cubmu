//
//  CouponModel.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import Foundation

struct CouponModel: Codable {
    let status: Bool?
    let statusCode: String?
    var result: [Results]?
    let option: String?
    let message: [String]?
}

struct Results: Identifiable, Codable {
    let id = UUID().uuidString
    let couponID, couponName, couponBrandName: String?
    let couponBrandLogo: String?
    let couponBenefitType, couponBenefitValue: String?
    let couponBenefitUnit: String?
    let couponQuota, couponCategoryID, couponCategoryName, couponTNC: String?
    let couponStatus, couponStartDate, couponEndDate, couponCreatedAt: String?
    let couponUpdatedAt: String?

    enum CodingKeys: String, CodingKey {
        case couponID = "couponId"
        case couponName, couponBrandName, couponBrandLogo, couponBenefitType, couponBenefitValue, couponBenefitUnit, couponQuota
        case couponCategoryID = "couponCategoryId"
        case couponCategoryName
        case couponTNC = "couponTnc"
        case couponStatus, couponStartDate, couponEndDate, couponCreatedAt, couponUpdatedAt
    }
}
