//
//  RequestApi.swift
//  nextcare
//
//  Created by apple on 2021/1/19.
//
import Alamofire
import SwiftyJSON
import Foundation

func GET(url:String,params:BaseReqModel,respModel:BaseRespModel.Type, succ:@escaping (BaseRespModel)->(), fail:@escaping(String)->(), complete:@escaping()->()){
    
    AF.request(url,requestModifier: {$0.timeoutInterval=8}).responseJSON { response in
        switch response.result{
        case .success:
            do {
                let json = try JSON(data: response.data!)
                let resp_data=respModel.init(jsonData: json)
                succ(resp_data)
            } catch {
                fail("解析错误")
            }
            break
        case .failure(let err):
            print(err)
            fail("请求异常")
            break
        }
        complete()
    }
}
