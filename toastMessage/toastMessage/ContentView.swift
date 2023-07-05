//
//  ContentView.swift
//  toastMessage
//
//  Created by Fadel Sultan on 18/12/1444 AH.
//

import SwiftUI

import SwiftUI

struct ToastView: View {
    let message:String
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                Text(message)
                    .font(.headline)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .opacity(isPresented ? 1 : 0)
                    .offset(y: isPresented ? 0 : -100)
                    .onChange(of: isPresented) { newValue in
                        if newValue {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    isPresented = false
                                }
                            }
                        }
                    }
            }
        }
    }
}


struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "Write you message!", isPresented: .constant(true))
    }
}


struct ContentViewToTryToast: View {
    @State private var isPresented = false

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Show Toast") {
                    isPresented.toggle()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
        }.overlay(ToastView(message: "Write Your message here 😜", isPresented: $isPresented))
    }
}
