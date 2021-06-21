//
//  MemosViewController.swift
//  RxMemo
//
//  Created by Yeonku on 2021/06/19.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemosViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemosViewModel!
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memos
            .bind(to: listTableView.rx.items(cellIdentifier: "cell")) {row, memo, cell in
                cell.textLabel?.text = memo.content
            }
            .disposed(by: rx.disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
