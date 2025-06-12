import SwiftUI

struct ScheduleListView: View {
    @ObservedObject private var watchSession = WatchSessionManager.shared
    @State private var showingQuickAdd = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(watchSession.receivedSchedules.sorted(by: { $0.date < $1.date })) { schedule in
                    NavigationLink(destination: ScheduleDetailView(schedule: schedule)) {
                        ScheduleRowView(schedule: schedule)
                    }
                }
            }
            .navigationTitle("Schedules")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { showingQuickAdd = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingQuickAdd) {
                QuickAddView()
            }
        }
    }
}

struct ScheduleRowView: View {
    let schedule: Schedule
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(schedule.title)
                .font(.headline)
            Text(schedule.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(schedule.exercises.count) exercises")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

struct ScheduleDetailView: View {
    let schedule: Schedule
    
    var body: some View {
        List {
            Section(header: Text("Details")) {
                Text("Date: \(schedule.date.formatted(date: .abbreviated, time: .omitted))")
                Text("Time: \(schedule.time.formatted(date: .omitted, time: .shortened))")
                Text("Total Exercises: \(schedule.exercises.count)")
            }
            
            Section(header: Text("Exercises")) {
                ForEach(schedule.exercises) { exercise in
                    NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                        Text(exercise.name)
                    }
                }
            }
        }
        .navigationTitle(schedule.title)
    }
}

#Preview {
    ScheduleListView()
} 