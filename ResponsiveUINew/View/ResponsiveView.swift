//
//  ResponsiveView.swift
//  ResponsiveUINew
//
//  Created by Michele Manniello on 11/09/22.
//

import SwiftUI

//MARK: Custom View which will give Useful Properties for Adopable Ui
struct ResponsiveView<Content: View>: View {
    var content:(Properties) -> Content
    init(@ViewBuilder content: @escaping (Properties)->Content) {
        self.content = content
    }
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            let isMaxSplit = isSplit() && size.width < 400
            
//            MARK: In vertical Hiding Side Br Completely
//            in Horizontal Showing Side bar for 0.75 Fraction
            let isAdoptable = isIpad && (isLandscape ? !isMaxSplit : !isSplit())
            let properties = Properties(isLandscape: isLandscape, isiPad: isIpad, isSplit: isSplit(), isMaxSplit: isMaxSplit,isAdoptable: isAdoptable ,size: size)
            
            content(properties)
                .frame(width: size.width, height: size.height)
        }
    }
    
//    MARK: Simple way to Find it the app is in split view
    func isSplit() -> Bool {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return false }
        return screen.windows.first?.frame.size != screen.screen.bounds.size
    }
}

struct ResponsiveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Properties {
    var isLandscape: Bool
    var isiPad: Bool
    var isSplit: Bool
//    MARK: if the App size is reduced more than 1/3 in split mode on iPad
    var isMaxSplit: Bool
    var isAdoptable: Bool
    var size: CGSize
}
