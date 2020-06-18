//
//  CheckoutVC.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/17/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerEmailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var shippingAddressTextField: UITextField!
    @IBOutlet weak var shippingCityTextField: UITextField!
    @IBOutlet weak var shippingCountryTextField: UITextField!
    @IBOutlet weak var shippingStateTextField: UITextField!
    @IBOutlet weak var shippingZipCodeTextField: UITextField!
    @IBOutlet weak var orderIdTextField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    // MARK: Variables
    var viewModel: CheckoutViewModel!
    var initialSetupViewController: PTFWInitialSetupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Checkout"
        
        setupBindings()
    }
    
    // MARK: Functions
    func clearAll() {
        textFields.forEach({ $0.text = "" })
    }
    
    func setupBindings() {
        viewModel.errorBlock = { [unowned self] message in
            self.showErrorMessage(with: message)
        }
        
        viewModel.validationSuccessBlock = { [unowned self] parameters in
            self.showPaymentVC(parameters: parameters)
        }
    }
    
    @IBAction func payNowButtonHandler(_ sender: UIButton) {
        let parameters = CheckoutParameters(amount: amountTextField.text!,
                                            customerName: customerNameTextField.text!,
                                            customerEmail: customerEmailTextField.text!,
                                            phoneNumber: phoneNumberTextField.text!,
                                            shippingAddress: shippingAddressTextField.text!,
                                            shippingCity: shippingCityTextField.text!,
                                            shippingCountry: shippingCountryTextField.text!,
                                            shippingState: shippingStateTextField.text!,
                                            shippingZipCode: shippingZipCodeTextField.text!,
                                            orderId: orderIdTextField.text!)
        viewModel.validate(parameters)
    }
    
    func showPaymentVC(parameters: CheckoutParameters) {
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: Float(parameters.amount) ?? 0.0,
            andWithCustomerTitle: parameters.customerName,
            andWithCurrencyCode: "USD",
            andWithTaxAmount: 0.0,
            andWithSDKLanguage: "en",
            andWithShippingAddress: parameters.shippingAddress,
            andWithShippingCity: parameters.shippingCity,
            andWithShippingCountry: parameters.shippingCountry,
            andWithShippingState: parameters.shippingState,
            andWithShippingZIPCode: parameters.shippingZipCode,
            andWithBillingAddress: parameters.shippingAddress,
            andWithBillingCity: parameters.shippingCity,
            andWithBillingCountry: parameters.shippingCountry,
            andWithBillingState: parameters.shippingState,
            andWithBillingZIPCode: parameters.shippingZipCode,
            andWithOrderID: parameters.orderId,
            andWithPhoneNumber: parameters.phoneNumber,
            andWithCustomerEmail: parameters.customerEmail,
            andIsTokenization: false,
            andIsPreAuth: false,
            andWithMerchantEmail: parameters.merchantEmail,
            andWithMerchantSecretKey: parameters.merchantKey,
            andWithAssigneeCode: "SDK",
            andWithThemeColor: #colorLiteral(red: 0.368627451, green: 0.3607843137, blue: 0.9019607843, alpha: 1),
            andIsThemeColorLight: false)
        
        self.view.addSubview(self.initialSetupViewController.view)
        self.addChild(self.initialSetupViewController)
        
        self.initialSetupViewController.didMove(toParent: self)
        
        self.initialSetupViewController.didReceiveBackButtonCallback = {
            
        }
        
        self.initialSetupViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
        }
        self.initialSetupViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
        }
        
        self.initialSetupViewController.didReceiveFinishTransactionCallback = { [unowned self] (responseCode, result, _, _, _, _, _) in
            
            guard responseCode == 100 else {
                self.showErrorMessage(with: result)
                return
            }
            
            self.showSuccessVC()
        }
    }
    
    func showSuccessVC() {
        let vc = SuccessVC()
        present(vc, animated: true) { [unowned self] in
            self.clearAll()
        }
    }
}

