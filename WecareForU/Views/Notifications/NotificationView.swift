//
//  NotificationView.swift
//  WecareForU
//
//  Created by RadhaKrishna Vajjha on 11/05/22.
//

import SwiftUI

struct Notification: Identifiable {
    var id = UUID()
    var isNotificationRead: Bool
    var notifMessage: String
    var date: String
    static let notifications = [Notification(isNotificationRead: false, notifMessage: "Hi, Your slot registration for 14th May has been confirmed", date: "May 13, 2022 at 5:15 PM"),
                                Notification(isNotificationRead: true, notifMessage: "Hi, Your slot registration for 13th May has been confirmed", date: "May 14, 2022 at 5:05 PM"),
                                Notification(isNotificationRead: true, notifMessage: "Hi, Your slot registration for 14th May has been confirmed", date: "May 15, 2022 at 6:15 PM"),
                                Notification(isNotificationRead: false, notifMessage: "Hi, Your slot registration for 16th May has been confirmed", date: "May 16, 2022 at 8:15 PM")]
}

struct NotificationView: View {
    @State private var notifications = Notification.notifications
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .top) {
                AppTopBackgroundView()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            for i in 0..<notifications.count {
                                notifications[i].isNotificationRead = true
                            }
                        }) {
                            Text("Mark all as read")
                        }
                        .padding(.top, 20)
                        .padding(.trailing, 20)
                        .font(Font.fontWith(.semiBold, size: .medium))
                    }
                    VStack {
                        ForEach(notifications.indices) { index in
                            let notifiction = notifications[index]
                            NotificationCardView(isNotificationRead: $notifications[index].isNotificationRead, notifMessage: notifiction.notifMessage, date: notifiction.date)
                                .onTapGesture {
                                    notifications[index].isNotificationRead = !notifications[index].isNotificationRead
                                }
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            Divider()
                        }
                        .buttonStyle(AppButtonStyle())
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .shadow(color: Color.clear, radius: 1, x: 0, y: 0)
                    )
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .padding(.top, 70)
            }
        }
        .navigationTitle(Text("Notifications"))
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .dismissKeyboardOnTap()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct NotificationCardView: View {
    let notifMessage: String
    let date: String
    @Binding var isNotificationRead: Bool
    init(isNotificationRead: Binding<Bool>,
         notifMessage: String,
         date: String) {
        self.notifMessage = notifMessage
        self.date = date
        self._isNotificationRead = isNotificationRead
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Circle()
                .fill(isNotificationRead ? .gray : Color.appPrimary)
                .frame(width: 8, height: 8)
                .padding(.top, 15)
            VStack(alignment: .leading, spacing: 5) {
                Text(notifMessage)
                    .font(Font.fontWith(.regular, size: .medium))
                    .padding(.top, 5)
                    .foregroundColor(isNotificationRead ? .gray : .black)
                Text(date)
                    .font(Font.fontWith(.regular, size: .small2))
                    .foregroundColor(isNotificationRead ? .gray : .appSecondary)
            }
        }
    }
}
