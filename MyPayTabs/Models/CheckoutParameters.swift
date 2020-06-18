//
//  CheckoutParameters.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

struct CheckoutParameters {
    var amount: String = ""
    var customerName: String = ""
    var customerEmail: String = ""
    var phoneNumber: String = ""
    var shippingAddress: String = ""
    var shippingCity: String = ""
    var shippingCountry: String = ""
    var shippingState: String = ""
    var shippingZipCode: String = ""
    var orderId: String = ""
    
    let merchantEmail = "soufian.el.hossary@gmail.com"
    let merchantKey = "FSU2XESaABnegC8ZBi4F9Kvee4yBay9Pq4SnILyjmWxDyGD9YHP8slmHqUiAtsqTwihf4PyrM54kMHuKpkTSFfz5aSGDk6xQpO6t"
}
