//
//  CouponCardComponent.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI
import Kingfisher

struct CouponCardComponent: View {
    
    public var item: Results
    @Binding public var getDetailCoupon: Results?
    @Binding public var onSheetCouponRedeem: Bool
    
    private func segue(item: Results) {
        getDetailCoupon = item
    }
    
    func convertDate(dateString:String) -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "id_ID_POSIX") as Locale
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formatter.date(from: dateString)
        let formatters = DateFormatter()
        formatters.locale = NSLocale(localeIdentifier: "id_ID_POSIX") as Locale
        formatters.dateFormat = "dd MMMM yyyy"
        return  date != nil ? formatters.string(from: date!) : ""
    }
    
    var body: some View {
        HStack(spacing: 25) {
            KFImage(URL(string: "\(item.couponBrandLogo ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))
                .resizable()
                .placeholder {ProgressView()}
                .cancelOnDisappear(true)
                .scaledToFill()
                .frame(width: 157, height: 178)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
            VStack(alignment: .leading, spacing: 10) {
                Text(item.couponBrandName ?? "")
                    .font(.custom(Constans.FontCustom.mulishBold, size: 20))
                HStack {
                    Text(item.couponBenefitValue ?? "")
                        .font(.custom(Constans.FontCustom.mulishBold, size: 24))
                        .foregroundColor(.green)
                    Text(item.couponBenefitType == "Discount" ? "Off" : "")
                        .font(.custom(Constans.FontCustom.mulishBold, size: 21))
                        .opacity(0.3)
                }
                Text("Promo sampai " + convertDate(dateString: item.couponEndDate ?? ""))
                    .font(.custom(Constans.FontCustom.mulishRegular, size: 11))
                    .opacity(0.55)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Text("Tukarkan")
                    .font(.custom(Constans.FontCustom.mulishBold, size: 14))
                    .foregroundColor(.white)
                    .frame(height: 35)
                    .frame(width: 190)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            segue(item: item)
                            onSheetCouponRedeem.toggle()
                        }
                    }
            }
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}
