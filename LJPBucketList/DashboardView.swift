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
				
				VStack {
					logoSection
						.frame(height: proxy.size.height / 2)

					menuButton
						.padding()
				}
			}
		}
    }
	
	private var logoSection: some View {
		
		VStack {
			
			Spacer()
			
			Image(.logo)
				.resizable()
				.aspectRatio(contentMode: .fit)
			
			Spacer()
		}
		.background(Color.accentColor)
		
	}
	
	private var menuButton: some View {
		
		VStack(spacing: 20) {
			
			Spacer()
			
			MenuButton(title: "LIST", action: showList)
			MenuButton(title: "COMPLETED", action: showCompleted)
			MenuButton(title: "INSTAGRAM REELS", action: showInstagram)
			
			Spacer()
		}
		
	}
	
	private func showList() {
		
	}
	
	private func showCompleted() {
		
	}
	
	private func showInstagram() {
		
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
