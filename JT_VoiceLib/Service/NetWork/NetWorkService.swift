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
    func getGather(pageNum: String) ->Observable<[GatherJsonModel]> {
        
        return findProvider.flatMap({ (provider) -> Observable<[GatherJsonModel]> in
            return Observable.create { (observer: AnyObserver<[GatherJsonModel]>) -> Disposable in
                provider.rx.request(FindMoya.getGather(pageNum: pageNum))
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let data = (try? response.mapJSON()) as? [String: Any] {
                            let models = [GatherJsonModel]()
                            observer.onNext(models)
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
