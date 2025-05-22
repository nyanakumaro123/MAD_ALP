//
//  MainView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showDatePicker: Bool = false
    @State private var selectedDate: Date = Date()
    
    var dateIndicator: String {
        let calender = Calendar.current
        
        if calender.isDateInToday(selectedDate) {
            return "TODAY"
        } else if selectedDate > Date() {
            return "FUTURE"
        } else {
            return "PAST"
        }
    }
    
    var dayName: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: selectedDate)
    }
    
    var dateOnly: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    //date indicator
                    VStack {
                        Text("\(dateIndicator)")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        Text("\(dayName), \(dateOnly)")
                            .font(.system(size: 20))
                    }.padding()
                    Spacer()
                    
                    selectDateButton
                    Spacer()
                }
                Spacer()
                
                Text("No events scheduled")
                    .font(.system(size: 24))
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView {
    private var selectDateButton: some View {
        ZStack {
            Button(action:{
                showDatePicker.toggle()
            }) {
                ZStack {
                    Rectangle()
                        .fill(
                            Color(red: 0.974,
                                  green: 0.964,
                                  blue: 0.965))
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.black)
                }
            }
        }
        .sheet(isPresented: $showDatePicker) {
            VStack {
                DatePicker("Select Date",
                    selection: $selectedDate,
                           //in:...Date(),
                    displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Button("Done") {
                    showDatePicker = false
                }.padding()
            }
        }
    }
    
}
