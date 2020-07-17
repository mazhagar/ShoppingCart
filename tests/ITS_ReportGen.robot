*** Settings ***
Resource            ../resources/keywords.robot
Suite Setup          Setup Browser
Suite Teardown       End suite



*** Test Cases ***

ITS_HomePage
	[tags]		HomePage
	[tags]            testgen	nwise=2
	Appstate       	    FrontPage
	ClickText      	    ${Mini_Quick}
	TypeText	quantity	3
	TypeText	skuId		${ItemNumber_Quick}
	ClickText	${AddToCartButton_Quick}
	#Paypal Checkout
	#ClickElement           //*[@id\="replaced_with_paypal_check_button"]/input[5]
	#TypeText	email	rsivakumar@dss-partners.com
	#ClickText	Next
	#TypeText	password	raviS9840@
	#ClickText	Log in
	#ClickText	Continue
	ClickElement	//*[@id\="cartform"]/div[3]/div[3]/div[3]/div[2]/input[3]
	
	ClickText           GUEST CHECKOUT
	#ClickText	SHIP TO THIS ADDRESS
	#ClickText	REVIEW ORDER
	
	TypeText	First Name	[Test,test]
	TypeText	Last Name	Name
	TypeText	Email	maaritest1@gmail.com
	# Switch checkbox to off
	ClickCheckbox       I agree         off
	TypeText	shippingAddress_address1		2352 Test Street
	DROPDOWN	shippingAddress_country		United States
	# Verify Country Dropdown
	VerifySelectedOption	shippingAddress_country	United States
	TypeText            City           New York
	DROPDOWN            shippingAddress_state          California
	TypeText           Zip/Postal Code  55632
	ClickCheckbox		shippingAddressAsBilling		on
	VerifyCheckboxValue	shippingAddressAsBilling		on
	TypeText         Telephone        1234567890
	LogScreenshot
	ClickText           CONTINUE
	VerifyText	Payment Details
	DROPDOWN        billing_creditCartType		masterCard
	#VerifySelectedOption	billing_creditCartType		visa
	TypeText	Card Number	5425233430109903
	TypeText	Name On Card	TestCard
	TypeText	CVV/Security Code	324
	DROPDOWN	billing_expirationDate		06-Jun
	DROPDOWN	billing_expirationYear		2023
	LogScreenshot
	ClickText	REVIEW ORDER
	#UseTable	Merchandise Subtotal
	#VerifyText	$138.82
	#${SubTotal}	GetText		//*[@id\="checkout-items"]/tbody/tr/td[5]/p/strong
	#${Shipping}	GetText		//*[@id\="confirmationform"]/div[3]/div[1]/div[3]/div[2]/div[1]/div[2]
	#${Handling}	GetText		//*[@id\="confirmationform"]/div[3]/div[1]/div[3]/div[2]/div[2]/div[2]
	#${EstimateTax}	GetText		//*[@id\="confirmationform"]/div[3]/div[1]/div[3]/div[2]/div[3]/div[2]
	#${Order_TOTAL}	GetText		//*[@id\="confirmationform"]/div[3]/div[1]/div[3]/div[4]/div[2]/strong
	#ShouldBeEqual	${Order_TOTAL} ==	${SubTotal}+${Shipping}+${Handling}+${EstimateTax}
	ClickText	PLACE ORDER
	VerifyTexts	Thank you for your order!
	${ORDERID}	GetText		Your Order ID is	between=???
	LogScreenshot
