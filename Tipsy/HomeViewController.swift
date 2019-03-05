/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class HomeViewController: UIViewController {
  @IBOutlet weak var billAmount: UITextField!
  @IBOutlet weak var tipPercent: UITextField!
  @IBOutlet weak var tipAmount: UILabel!
  @IBOutlet weak var totalBill: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
  }


  @IBAction func didTapCalculate(_ sender: UIButton) {

    let bill = billAmount.text
    let amount = (bill! as NSString).doubleValue

    let percent = (tipPercent.text! as NSString).doubleValue
    let tipAmt = (percent * amount)/100
    tipAmount.text = String(tipAmt)

    let total = tipAmt + amount
    totalBill.text = String(total)
    if billAmount.isFirstResponder {
      billAmount.resignFirstResponder()
    }

    if tipPercent.isFirstResponder {
      tipPercent.resignFirstResponder()
    }
    tipAmount.superview?.isHidden = false
    totalBill.superview?.isHidden = false
  }
}

extension HomeViewController: UITextViewDelegate {
  @IBAction func textViewDidBeginEditing(_ textView: UITextView) {
    tipAmount.superview?.isHidden = true
    totalBill.superview?.isHidden = true
  }
}
