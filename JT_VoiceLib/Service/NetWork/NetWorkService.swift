//
//  NetWorkService.swift
//  JT_VoiceLib
//
//  Created by 江涛 on 2017/11/7.
//  Copyright © 2017年 江涛. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import HandyJSON

class NetWorkService {
    
    internal static let sharedInstance = {
        return NetWorkService()
    }()
    
    private init() {}
    
    // dispose bag
    fileprivate let disposeBag = DisposeBag()
    
    // findVC  moya probider
    fileprivate var findProvider : Observable<MoyaProvider<FindMoya>> {
        return Observable.create { (observable : AnyObserver<MoyaProvider<FindMoya>>) in
            let provider = MoyaProvider<FindMoya>()
            observable.onNext(provider)
            return Disposables.create()
        }
    }
    
    // MARK - 获取首页GatherList
    func getGather(pageNum: String) ->Observable<SectionOfGather> {
        
        return findProvider.flatMap({ (provider) -> Observable<SectionOfGather> in
            return Observable.create { (observer: AnyObserver<SectionOfGather>) -> Disposable in
                provider.rx.request(FindMoya.getGather(pageNum: pageNum))
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let datas = (try? response.mapJSON()) as? [String: Any] {
                            let sectionOfGather = SectionOfGather.deserialize(from: datas)
//                            var models = [GatherJsonModel]()
//                            let list = datas["list"] as? [[String : Any]]
//                            guard let a = list else { return }
//                            for data in a {
//                                let model = GatherJsonModel.deserialize(from: data)
//                                models.append(model!)
//                            }
                            observer.onNext(sectionOfGather!)
                            observer.onCompleted()
                        } else {
                            observer.onError("NetworkErrorCode.internalError" as! Error)
                        }
                    }, onError: { (error) in
                        
                    }).disposed(by: self.disposeBag)
                return Disposables.create()
            }
        })
        
    }
}
