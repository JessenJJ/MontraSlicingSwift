//
//  OnBoardingView.swift
//  MontraDev
//
//  Created by User50 on 18/04/24.
//

import SwiftUI

struct OnBoardingView: View {
    var tabs: [Onboarding] = Onboarding.data
    let dotIndicator = UIPageControl.appearance()
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack{
            TabView (selection:$selectedTab){
                ForEach(tabs) { tab in
                    OnBoardingSingleView(content: tab)
                        .tag(tab.tag)
                }
            }
            //            .onAppear{
            //                dotIndicator.currentPageIndicatorTintColor = UIColor(named:"Violet 100")
            //                dotIndicator.pageIndicatorTintColor =
            //                UIColor(named:"Violet 20")
            //            }
            //            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
            
            .animation(.easeOut,value: selectedTab)
            CustomDotIndicator(count: tabs.count,selectedTab: $selectedTab)
                .padding([.top,.bottom],10)
        }
    }
}

#Preview {
    OnBoardingView()
}
