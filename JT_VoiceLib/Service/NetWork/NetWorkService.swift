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
    
    // library moya provider
    fileprivate var libraryProvider : Observable<MoyaProvider<LibraryMoya>> {
        return Observable.create { (observable : AnyObserver<MoyaProvider<LibraryMoya>>) in
            let provider = MoyaProvider<LibraryMoya>()
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
    
    // MARK: -  获取专辑列表
    func getAlbumsList(uid: String, pageNum: String) -> Observable<SectionOfAlbums> {
        
        return findProvider.flatMap({ (provider) -> Observable<SectionOfAlbums> in
            return Observable.create({ (observer : AnyObserver<SectionOfAlbums>) -> Disposable in
                provider.rx.request(FindMoya.getAlbumsList(uid: uid, pageNum: pageNum))
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let datas = (try? response.mapJSON()) as? [String: Any] {
                            let sectionOfAlbums = SectionOfAlbums.deserialize(from: datas)
                            observer.onNext(sectionOfAlbums!)
                            observer.onCompleted()
                        } else {
                             observer.onError("NetworkErrorCode.internalError" as! Error)
                        }
                    }, onError: { (error) in
                        
                    }).disposed(by: self.disposeBag)
                return Disposables.create()
            })
        })
    }
    
    // MARK: - 获取专辑详情
    func getTracksList(uid: String, pageNum: String) -> Observable<SectionOfTracks> {
        
        return findProvider.flatMap({ (provider) -> Observable<SectionOfTracks> in
            return Observable.create({ (observer: AnyObserver<SectionOfTracks>) -> Disposable in
                provider.rx.request(FindMoya.getTacksList(uid: uid, pageNum: pageNum))
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let datas = (try? response.mapJSON()) as? [String: Any] {
                            let sectionOfTracks = SectionOfTracks.deserialize(from: datas)
                            observer.onNext(sectionOfTracks!)
                            observer.onCompleted()
                        } else {
                            observer.onError("NetworkErrorCode.internalError" as! Error)
                        }
                    }, onError: { (error) in
                        
                    }).disposed(by: self.disposeBag)
                return Disposables.create()
            })
        })
    }
    
    // MARK: - 获取音库类别列表
    func getCategotyList() -> Observable<[CategoryJsonModel]> {
        
        return libraryProvider.flatMap({ (provider) -> Observable<[CategoryJsonModel]> in
            return Observable.create({ (observer: AnyObserver<[CategoryJsonModel]>) -> Disposable in
                provider.rx.request(LibraryMoya.getCategory())
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let datas = (try? response.mapJSON()) as? [String: Any] {
                            let listArr = datas["tags"] as! [[String : Any]]
                            var tempArr = [CategoryJsonModel]()
                            for dic in listArr {
                                let model = CategoryJsonModel.deserialize(from: dic)
                                tempArr.append(model!)
                            }
                            observer.onNext(tempArr)
                            observer.onCompleted()
                        } else {
                            observer.onError("NetworkErrorCode.internalError" as! Error)
                        }
                    }, onError: { (error) in
                        
                    }).disposed(by: self.disposeBag)
                return Disposables.create()
            })
        })
    }
    
    // MARK: - 获取音库类别详情列表
    func getCategotyDetailList(catelog: String, pageNum: String) -> Observable<[CategoryDetailListJsonModel]> {

        return libraryProvider.flatMap({ (provider) -> Observable<[CategoryDetailListJsonModel]> in
            return Observable.create({ (observer: AnyObserver<[CategoryDetailListJsonModel]>) -> Disposable in
                provider.rx.request(LibraryMoya.getCategoryDetail(type: catelog, pageNum: pageNum))
                    .asObservable()
                    .subscribe(onNext: { (response) in
                        if let datas = (try? response.mapJSON()) as? [String: Any] {
                            let listArr = datas["list"] as! [[String : Any]]
                            var tempArr = [CategoryDetailListJsonModel]()
                            for dic in listArr {
                                let model = CategoryDetailListJsonModel.deserialize(from: dic)
                                tempArr.append(model!)
                            }
                            observer.onNext(tempArr)
                            observer.onCompleted()
                        } else {
                            observer.onError("NetworkErrorCode.internalError" as! Error)
                        }
                    }, onError: { (error) in

                    }).disposed(by: self.disposeBag)
                return Disposables.create()
            })
        })
    }
}
