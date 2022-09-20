//
//  DoctorDetailView.swift
//  WecareForU
//
//  Created by apple on 5/5/22.
//

import SwiftUI


struct DoctorDetailView: View {
    @State var data: Info
    let image: UIImage
    @State private var isSelectedSchedule = Schedule.example
    @State private var isAppointmentSuccess = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .top) {
                AppTopBackgroundView()
                VStack(alignment: .leading, spacing: 50) {
                    Spacer().frame(width: 50)
                    HStack(spacing: 20) {
                        Image(uiImage: image)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                            .padding(.top, 10)
                        DoctorPersonalInfoView(data: data)
                    }
                    
                    DoctorContactDetailView(data: data.contactDetail!)
                    
                    DoctorAvailabilityDetailView(time: data.availabilityTime ?? "")
                    
                    DoctorScheduleView(schedules: data.schedules!, isSelectedValue: { schedule in
                        isSelectedSchedule = schedule
                    })
                    
                }
                .padding(20)
            }
            
        }
        .ignoresSafeArea(.all)
        .navigationTitle(Text("Book Your Slot"))
        VStack {
            BottomProfileView(action: {
                // TODO: make this toggle on service call success
                isAppointmentSuccess.toggle()
                mapTheSelectedValueToArray()
            }, title: "Book Appointment")
            .foregroundColor(.white)
            .frame(height: 80)
        }.alert(isPresented: $isAppointmentSuccess) {
            Alert(title: Text("Success!"), message: Text("Appointment with \(data.name ?? "doctor") at \(isSelectedSchedule.time ?? "") is suceess"), dismissButton: .default(Text("Okay"), action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }))
        }
    }
    
    // TODO: Remove this logic - where this is for to display in bookings section - later it will be fetched from server
    fileprivate func mapTheSelectedValueToArray() {
        if data.schedules!.contains(where: { $0.time == isSelectedSchedule.time }) {
            data.schedules?.removeAll()
            data.schedules?.append(isSelectedSchedule)
        }
        rootViewModel.bookings?.append(data)
        debugPrint(data.contactDetail)
        debugPrint(rootViewModel.bookings?[0])
    }
    
}

struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailView(data: Info.example, image: UIImage(named: "doctorImage2")!)
    }
}
