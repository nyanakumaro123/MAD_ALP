//
//  MainView.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var showDatePicker: Bool = false
    @State private var selectedDate: Date = Date()
    @State private var isAddExercise = false
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    
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
            ZStack(alignment: .bottom) {
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
                    
                    let calendar = Calendar.current
                    let startOfDay = calendar.startOfDay(for: selectedDate)
                    
                    let filteredSchedules = scheduleViewModel.schedules.filter { schedule in
                        let scheduleDate = calendar.startOfDay(for: schedule.date)
                        return scheduleDate == startOfDay
                    }
                    
                    if filteredSchedules.isEmpty {
                        VStack {
                            Spacer()
                            Text("No Schedule")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                    else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(Array(filteredSchedules.enumerated()), id: \.element.id) { index, schedule in
                                    ScheduleCard(schedule: schedule, index: index)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                    Spacer()
                }
                
                // Plus Button
                HStack(alignment: .bottom) {
                    Spacer()
                    
                    Button(action: {
                        isAddExercise = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(24)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(200)
                    }
                }
                .padding(.bottom, 48)
                .padding(.trailing, 40)
            }
            .fullScreenCover(isPresented: $isAddExercise) {
                AddScheduleView(date: selectedDate)
                    .environment(\.modelContext, modelContext)
            }
            .onAppear {
                scheduleViewModel.setModelContext(modelContext)
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: [Schedule.self, Exercise.self], inMemory: true)
        .environmentObject(ExerciseViewModel())
        .environmentObject(ScheduleViewModel())
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
