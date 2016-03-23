//
//  ViewController.m
//  AFNST
//
//  Created by 段瑞权 on 16/3/23.
//  Copyright © 2016年 H.MH. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UIButton *LogingBtn;
- (IBAction)loginAction:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}





- (IBAction)loginAction:(id)sender {
    
//    //http://wanjiwuhanyuming.oicp.net:8082/OBU/WJOBU
//    // {@"CmdType":@"CustomerLogin",@"CustomerAccount":@"lzb",@"Password":@"123456",@"LoginType":@"android"}
//    NSString *usrstring = @"http://wanjiwuhanyuming.oicp.net:8082/OBU/WJOBU";
//    NSDictionary *param = @{@"CmdType":@"CustomerLogin",@"CustomerAccount":@"shaochong",@"Password":@"123456",@"LoginType":@"android"};
//    //    [HttpTool postWithUrl:usrstring params:param success:^(id data) {
//    //        NSLog(@"%@",data);
//    //    }failure:^(NSError *error) {
//    //        NSLog(@"%@",error);
//    //    }];
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    [mgr.requestSerializer setTimeoutInterval:10.0];
//    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
//    //        [mgr setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", @"text/javascript", nil];
//    [mgr POST:usrstring parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        //        success(responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        //        failure(error);
//        NSLog(@"%@",error);
//    }];
    
    
    
    
    
    NSString *usrstring = @"http://wanjiwuhanyuming.oicp.net:8082/OBU/";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *param = @{@"CmdType":@"CustomerLogin",@"CustomerAccount":@"lzb",@"Password":@"123456",@"LoginType":@"android"};
    
    [manager POST:usrstring parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSLog(@"%@",formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *reDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"success = %@",reDict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    
    
}
@end
