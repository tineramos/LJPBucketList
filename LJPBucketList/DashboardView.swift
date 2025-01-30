//
//  ContentView.swift
//  LJPBucketList
//
//  Created by Tine Ramos on 19/11/2024.
//

import SwiftUI
import SwiftData

struct DashboardView: View {

    var body: some View {
		NavigationStack {
			
			GeometryReader { proxy in
				
				ZStack {
					gradientBackground
					
					VStack(spacing: 16) {
						logoHeader
						
						Image(.Dashboard.cover)
							.resizable()
							.frame(alignment: .center)
							.aspectRatio(contentMode: .fit)
						
						Spacer()
					}
				}
			}
		}
    }
	
	private var gradientBackground: some View {
		LinearGradient(gradient: Gradient(colors: [.dashboardBackground, .white]),
					   startPoint: .top,
					   endPoint: .bottom)
		.ignoresSafeArea()
	}
	
	private var logoHeader: some View {
		HStack {
			Image(.Dashboard.bucket)
			Image(.Dashboard.ljpBucketListLogo)
			Spacer()
		}
		.padding(.horizontal, 24)
	}
}

struct MenuButton: View {
	
	let title: String
	let action: () -> Void
	
	var body: some View {
		
		Button {
			action()
		} label: {
			
			Text(title)
				.fontWeight(.bold)
				.padding()
				.frame(maxWidth: .infinity)
				.foregroundStyle(.accent)
				.background(
					RoundedRectangle(cornerRadius: 5,
									 style: .continuous)
						.stroke(lineWidth: 3))
			
		}
		
	}
}

#Preview {
	DashboardView()
}
