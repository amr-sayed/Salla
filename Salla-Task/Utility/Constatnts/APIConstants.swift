//
//  APIConstants.swift
//  Lemonada
//
//  Created by Amr Elsayed on 03/07/2023.
//

import Foundation

public enum APIConstants: String, CaseIterable {
    
    case login = "Authentication/login"
    case reservations = "ReservationBookingMobile/get-all-reservations"
    case venues = "VenueMobile/get-all-venues"
    case reservationTypes = "ReservationTypeMobile/get-resType-byVenueId"
    case timeSlotCategory = "TimeSlotCategoryMobile/get-timeSlotCategory-by-resTypeId"
    case seatType = "SeatTypesMobile/get-seatType_by_resTypeId"
    case reservationStatus = "ReservationBookingMobile/get-reservation-status"
    case clientType = "ClientMobile/get-all-clientType"
    case uodateReservationStatus = "ReservationBookingMobile/update-res-status"
    case venueTables = "ReservationBookingMobile/get-venueTables-ByResId"
    case updateReservationTable = "ReservationBookingMobile/update-res-table"
    case timeSlot = "TimeSlotMobile/get-timeSlots-by-timeSlotCategoryId"
    case editReservation = "ReservationBookingMobile/edit-res"
    case reservationLog = "ReservationBookingMobile/get-res-history"
    case guestList = "ReservationBookingMobile/get-res-guestlist"
    case updateGuestList = "ReservationBookingMobile/checkin-guestlist-withName"
    case clientReservationHistory = "ReservationBookingMobile/get-res-history-byClientId"
    case clientData = "ClientMobile/get-clinet-ById"
    case bookReservation = "ReservationBookingMobile/Book-New-Reservation"
    case countries = "ReservationBookingMobile/get-country-phoneCodes"
    case hasClient = "ReservationBookingMobile/check-phone-hasClient"
    case clientList = "ClientMobile/get-all-clients"
    case sendNotificationBrodadcast = "NotificationsMobile/send-multi-notification"
    case sendSMSBrodadcast = "NotificationsMobile/send-multi-messages"
    case reservationBy = "UserMobile/fill-users-ddl"
    case disconfirmAll = "ReservationBookingMobile/update-res-status-bulk"
    case statistics = "StatasticsMobile/get-statastics-status"

}
