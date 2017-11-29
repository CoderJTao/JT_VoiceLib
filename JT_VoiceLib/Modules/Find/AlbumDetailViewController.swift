//
//  AlbumDetailViewController.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/15.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class AlbumDetailViewController: UIViewController {
    
    var passAlbumId : Int? {
        didSet {
            self.viewModel.loadData(uid: passAlbumId!, pageNum: pageNum)
        }
    }
    
    var pageNum = 1
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let viewModel = AlbumDetailViewModel()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavigationBackButton()
        setUpTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       
    }
    
    
    // MARK: - 设置tableView
    func setUpTableView() {
        self.title = "专辑列表"
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
                
        self.tableView.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        self.viewModel.albumDetailModels.asObservable().observeOn(MainScheduler.instance)
            .bind(to: self.tableView.rx.items(dataSource: self.viewModel.dataSource))
            .disposed(by: self.disposeBag)
        
        self.tableView.rx.itemSelected
            .subscribe(onNext: { [unowned self] index in
//                if index.row > 0 {
//                    let cell = self.tableView.cellForRow(at: index) as! AlbumDetailCell
//                    self.itemSelected(model: cell.jsonModel!)
//                }
            })
            .disposed(by: disposeBag)
    }
    
    private func itemSelected(model:TracksJsonModel) {
        let storyboard = UIStoryboard(name: "Play", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PlayViewController") as? PlayViewController {
            
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func backClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension AlbumDetailViewController: UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260
        } else {
            return 80
        }
    }
}

extension AlbumDetailViewController {
    
    
   
}
