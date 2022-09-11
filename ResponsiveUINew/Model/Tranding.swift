//
//  Tranding.swift
//  ResponsiveUINew
//
//  Created by Michele Manniello on 11/09/22.
//

import SwiftUI
// MARK: Trending Dished Model and sample Data

struct Trending: Identifiable {
   
    var id:String = UUID().uuidString
    var title: String
    var subTitle: String
    var count: Int
    var image: String
}
var trendingDishes : [Trending] = [
Trending(title: "American Favourite", subTitle: "Order", count: 120, image: "Pizza1"),
Trending(title: "Super Supreme", subTitle: "Order", count: 90, image: "Pizza2"),
Trending(title: "Orange Juice", subTitle: "Order", count: 110, image: "Pizza3"),
Trending(title: "Chicken", subTitle: "Order", count: 70, image: "OrangeJuice"),
]



