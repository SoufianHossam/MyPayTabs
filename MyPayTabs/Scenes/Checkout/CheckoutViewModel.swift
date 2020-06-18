//
//  CheckoutViewModel.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

class CheckoutViewModel {
    // MARK: Blocks
    var errorBlock: ((String) -> Void)?
    var validationSuccessBlock: ((CheckoutParameters) -> Void)?
    
    func validate(_ parameters: CheckoutParameters) {
        let validator = Validator()
        
        guard validator.isValid(against: .emptyField(parameters.amount)) else {
            errorBlock?("Amount field can't be empty")
            return
        }
        
        guard validator.isValid(against: .integer(parameters.amount)) else {
            errorBlock?("Please enter valid amount")
            return
        }
        
        guard validator.isValid(against: .nonZero(parameters.amount)) else {
            errorBlock?("Amount Field can't be zero")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.customerName)) else {
            errorBlock?("Customer Name field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.customerEmail)) else {
            errorBlock?("Customer Email field can't be empty")
            return
        }
        
        guard validator.isValid(against: .email(parameters.customerEmail)) else {
            errorBlock?("Please enter valid email")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.phoneNumber)) else {
            errorBlock?("Phone Number field can't be empty")
            return
        }
        
        guard validator.isValid(against: .phoneNumber(parameters.phoneNumber)) else {
            errorBlock?("please enter valid Egyption number")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.shippingAddress)) else {
            errorBlock?("Shipping Address field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.shippingCity)) else {
            errorBlock?("Shipping City field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.shippingCountry)) else {
            errorBlock?("Shipping Country field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.shippingState)) else {
            errorBlock?("Shipping State field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.shippingZipCode)) else {
            errorBlock?("Shipping Zip Code field can't be empty")
            return
        }
        
        guard validator.isValid(against: .emptyField(parameters.orderId)) else {
            errorBlock?("Order Id field can't be empty")
            return
        }
        
        guard validator.isValid(against: .integer(parameters.orderId)) else {
            errorBlock?("Order Id is not valid")
            return
        }
        
        guard validator.isValid(against: .nonZero(parameters.orderId)) else {
            errorBlock?("Order Id can't be zero")
            return
        }
        
        validationSuccessBlock?(parameters)
    }
}
