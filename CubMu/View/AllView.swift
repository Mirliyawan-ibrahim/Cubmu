//
//  ContentView.swift
//  CubMu
//
//  Created by Mirliyawan Ibrahim on 28/01/23.
//

import SwiftUI

struct AllView: View {
    
    @StateObject private var vmCoupon = CouponViewModel()
    @State private var onSheetCouponRedeem: Bool = false
    @State public var getDetailCoupon: Results? = nil
    @State private var showLoading: Bool = false
    @State private var showSearch: Bool = false
    @State private var searchText: String = ""
    
    var dataCoupon: [Results] {
        if searchText.isEmpty {
            return vmCoupon.dataCoupon
        } else {
            return vmCoupon.dataCouponSearch
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.background(ignoresSafeAreaEdges: .top)
            VStack(spacing: 25) {
                if showSearch {
                    HStack {
                        SearchBarComponent(searchText: $searchText, backSearch: $showSearch)
                    }
                } else {
                    HStack {
                        Image("iconCubMu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 112, height: 36)
                        Spacer()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    showSearch.toggle()
                                }
                            }
                        Spacer()
                        Image(systemName: "bell.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                            .overlay (
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8.5, height: 8.5)
                                , alignment: .topTrailing
                            )
                        Spacer()
                        Image("profilImage")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                    .frame(maxWidth: .infinity)
                }
               
                
                
                HStack {
                    Text("Benefit Kupon Untuk Kamu")
                        .font(.custom(Constans.FontCustom.mulishBold, size: 23))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            GeometryReader { geo in
                ScrollView(showsIndicators: false) {
                    ForEach(dataCoupon) { item in
                            CouponCardComponent(
                                item: item,
                                getDetailCoupon: $getDetailCoupon,
                                onSheetCouponRedeem: $onSheetCouponRedeem
                            )
                            .frame(maxWidth: geo.size.width * 1)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.bottom, 7)
                    }
                    .animation(.spring(), value: searchText)
                    .onChange(of: searchText) { searchCoupon in
                        vmCoupon.dataCouponSearch = vmCoupon.dataCoupon.filter({ coupon in
                            coupon.couponBrandName!.lowercased().contains(searchCoupon.lowercased()) ||
                            coupon.couponName!.lowercased().contains(searchCoupon.lowercased())
                        })
                    }
                }
            }
            .sheet(isPresented: $onSheetCouponRedeem, content: {
                CouponRedeemDetailComponent(item: $getDetailCoupon)
            })
            .padding(.top, showSearch ? 140 : 130)
            .refreshable {
                vmCoupon.getCoupon()
            }
            .onAppear {
                UIRefreshControl.appearance().tintColor = UIColor.white
                showLoading = true
                vmCoupon.getCoupon()
                vmCoupon.successRequest = { [] in
                    showLoading = false
                    showSearch = false
                }
            }
            if showLoading {
                ZStack {
                    Color.black.background(ignoresSafeAreaEdges: .top)
                    ProgressView()
                        .tint(.white)
                }
            }
        }
    }
}

struct AllView_Previews: PreviewProvider {
    static var previews: some View {
        AllView()
    }
}
