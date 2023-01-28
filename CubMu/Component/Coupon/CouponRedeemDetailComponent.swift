//
//  RedeemCouponDetailComponent.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI
import Kingfisher

struct CouponRedeemDetailComponent: View {
    
    @Binding public var item: Results?
    @Environment(\.presentationMode) var presentationMode
    
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
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                VStack {
                    KFImage(URL(string: "\(item?.couponBrandLogo ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))
                        .resizable()
                        .placeholder {ProgressView()}
                        .cancelOnDisappear(true)
                        .scaledToFill()
                        .frame(height: 350)
                        .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .top)
                        .offset(y: 20)
                }
                VStack(spacing: 15) {
                    HStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item?.couponBrandName ?? "")
                                .font(.custom(Constans.FontCustom.mulishBold, size: 23))
                            Text("Promo sampai " + convertDate(dateString: item?.couponEndDate ?? ""))
                                .font(.custom(Constans.FontCustom.mulishRegular, size: 14))
                                .opacity(0.55)
                        }
                        Spacer()
                        Text(item?.couponBenefitValue ?? "")
                            .font(.custom(Constans.FontCustom.mulishBold, size: 25))
                            .foregroundColor(.green)
                            .frame(width: 100)
                        Spacer()
                    }
                    VStack{
                        Text("Coupon Successfully Redeemed")
                            .font(.custom(Constans.FontCustom.mulishBold, size: 25))
                            .foregroundColor(.green)
                            .frame(width: 350, height: 140, alignment: .center)
                            .multilineTextAlignment(.center)
                        Text("12:30 PM")
                            .font(.custom(Constans.FontCustom.mulishRegular, size: 16))
                            .opacity(0.45)
                            .offset(y: -35)
                    }
                    VStack {
                        Text("DONE")
                            .font(.custom(Constans.FontCustom.mulishRegular, size: 18))
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                    }
                }
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color.white
                    .clipShape(CustomCornersPage(corners: [.topLeft, .topRight], radius: 25))
                )
            }
        }
    }
}
