/*:
 ## Properties and Access Control
 
 ### Swift Bank
 
 Exercise:
 
 We’ll use properties and access control to build a structure that represents a secure personal bank account. We will be able to initialize the account with a password and initial deposit, make deposits, make withdrawals, and check the balance.

 For our bank to remain competitive and earn lots of new customers, we will offer a cash bonus every time a user makes a deposit. Additionally, we’ll configure a property observer to let us know whenever our bank balance is set so that we can display alerts.

 We’ll apply the concept of structures, private methods, property observers, and type properties.
 
 */
import Foundation

// 1
struct SwiftBank {
  // MARK: - ATRIBUTES
  // 2: access level of private so we can only access it within the scope of our structure SwiftBank.
    private let password: String
    // 5:  Due to the sensitive nature of this data, we want to prevent any code outside of the scope of the SwiftBank structure to have read or write access to the balance
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    private var bonusValidation: Bool = true
    // 6: This is a good place to use a type property, since it will be the same for every account
    static let depositBonusRate = 0.01

    //MARK: - INITIALIZER
    // 3
    init(password: String, initialDeposit: Double) {
        self.password = password
        // 9
        makeDeposit(ofAmount: initialDeposit)
    }

    // MARK: - HELPER METHODS
    // 4
    private func isValid(_ enteredPassword: String) -> Bool {
        if enteredPassword == self.password {
            return true
        }
        else {
            return false
        }
    }
    // 7:
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    // 12
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
    // 18
    private func isPositive(_ amount: Double) -> Bool {
          if amount <= 0 {
            print("The amount must be higher than zero.")
              return false
          } else {
              return true
          }
    }

    //MARK: - INTERNAL METHODS ( default access )
    // 8: methods that modify structure properties must be marked as mutating.
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        if !isPositive(depositAmount) {
          return
        } else if depositAmount < 1000.00 || !bonusValidation {
            print("Making a deposit of $\(depositAmount).")
            self.balance += depositAmount
        } else {
            let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
            print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus).")
            self.balance += depositWithBonus
            bonusValidation = false
        }
    }
    // 11
    mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
        if !isValid(password) {
            print("Error: Invalid password. Cannot make withdrawal.")
            return
        } else if !isPositive(withdrawalAmount) {
            return
        } else if withdrawalAmount > balance {
            print("The withdrawal must be higher than your balance.")
            return
        } else {
            self.balance -= withdrawalAmount
            print("Making a $\(withdrawalAmount) withdrawal")
        }
    }
    // 10
    func displayBalance(usingPassword password: String) {
        if !isValid(password) {
          print("Error: Invalid password. Cannot retrieve balance.")
            return
        } else {
          print("Your current balance is $\(self.balance)")
        }
    }
}

var myAccount = SwiftBank(password: "paty", initialDeposit: 500)
myAccount.displayBalance(usingPassword: "paty")
myAccount.makeDeposit(ofAmount: 50)
myAccount.displayBalance(usingPassword: "paty")
myAccount.makeWithdrawal(ofAmount: 100, usingPassword: "paty")
myAccount.displayBalance(usingPassword: "paty")
myAccount.makeDeposit(ofAmount: -800)
myAccount.displayBalance(usingPassword: "paty")
myAccount.makeDeposit(ofAmount: 1000)
myAccount.displayBalance(usingPassword: "paty")
myAccount.makeWithdrawal(ofAmount: 3000, usingPassword: "paty")
/*:
 OUTPUT:
 
 Making a deposit of $500.0.
 Your current balance is $500.0
 Making a deposit of $50.0.
 Your current balance is $550.0
 Making a $100.0 withdrawal
 Your current balance is $450.0
 The amount must be higher than zero.
 Your current balance is $450.0
 Making a deposit of $1000.0 with a bonus rate. The final amount deposited is $1010.0.
 Your current balance is $1460.0
 The withdrawal must be higher than your balance.

 */
//: [< Previous](@previous) | [Next: Classes](@next)
