//
//  MainViewController.m
//  Demo
//
//  Created by csc on 16/1/8.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "MainViewController.h"
//#import "MBProgressHUD+LBX.h"
#import "LBXDeviceUtil.h"
#import "Categoryheaders.h"
#import "Permissions.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *str = [LBXDeviceUtil getUUID];
    
    NSLog(@"UUID:%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testHud:(id)sender {
    
    [self hud1];
    
//    [self waitingHud];
    
   // [Permissions isGetCameraPermission];
    
//    UIButton *btn = sender;
//    
//    [btn setBackgroundColor:[UIColor blueColor]];
//    
//    [Permissions getCameraPermission:^(BOOL allowed) {
//       
//        NSLog(@"%d",allowed);
//        
//        if (!allowed) {
//            
//            [Permissions openPermissionSetting];
//        }
//        
//    }];
//
//    [Permissions getPhotoPermission:^(BOOL allowed) {
//       
//        NSLog(@"getPhotoPermission：%d",allowed);
//    }];
    
    
   
}

- (void)waitingHud
{
    [MBProgressHUD showWaitingWithMessage:@"loading" onView:self.view];
    
    [self performSelector:@selector(dismissWaiting) withObject:nil afterDelay:2.0];
}

- (void)dismissWaiting
{
    [MBProgressHUD dismissWaitingWithView:self.view];
}

- (void)hud1
{
    [MBProgressHUD showErrorMessage:@"123" onView:self.view];
}


@end
