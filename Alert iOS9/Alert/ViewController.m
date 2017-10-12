//
//  ViewController.m
//  Alert
//
//  Created by Silver on 15/11/3.
//  Copyright © 2015年 Silver. All rights reserved.
//

#import "ViewController.h"
#import "common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, 100, 40)];
    btn.backgroundColor = [UIColor greenColor];
    btn.tag = 10;
    [btn setTitle:@"alertView" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(120, 50, 100, 40)];
    btn1.backgroundColor = [UIColor greenColor];
    btn1.tag = 11;
    [btn1 setTitle:@"actionSheet" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 120, 150, 40)];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"commonalertView" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(commonalertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(170, 120, 170, 40)];
    btn3.backgroundColor = [UIColor greenColor];
    [btn3 setTitle:@"commonActionSheet" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(commonActionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];


}

- (void)btnClick:(UIButton *)btn{
    
    //1, 创建控件  包含： 主题 信息 样式
    UIAlertController *alertController = nil;
    NSInteger tag = btn.tag;
    switch (tag) {
        case 10://alertView
        {
            alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
        
        }
            
            break;
        case 11://actionSheet
        {
            alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
        
        }
            
            break;
            
        default:
            break;
    }
    
    //2, 创建按钮  第一种方法 取消样式UIAlertActionStyleCancel
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"取消－－－－－－－－－－");
    }];
    [alertController addAction:action];
    
    //创建按钮 第二种方法 确认样式UIAlertActionStyleDefault
    [alertController addAction:({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (alertController.preferredStyle == UIAlertControllerStyleAlert) {
                NSLog(@"确定－－－－－－－－－－name:%@, passWord:%@", alertController.textFields[0].text,alertController.textFields[1].text);
            }else{
                NSLog(@"确定－－－－－－－－－－");
            }
        }];
        action;
    })];
    
    //创建按钮 可以写任何方法 执行样式UIAlertActionStyleDestructive
    [alertController addAction:({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"执行方法" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"执行方法－－－－－－－－－－");
        }];
        //此按钮禁用
        action.enabled = NO;
        action;
    })];
    
    //3, 添加 UITextField  只有alertView可以添加 actionSheet不能添加 需要判断
    if (alertController.preferredStyle == UIAlertControllerStyleAlert) {

        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        
            textField.placeholder = @"请输入用户名";
            textField.textAlignment = NSTextAlignmentCenter;
        }];
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
            
            textField.placeholder = @"请输入密码";
            textField.textAlignment = NSTextAlignmentCenter;
            textField.secureTextEntry = YES;
            //背景不好看
//            textField.backgroundColor = [UIColor grayColor];
            //改变输入框的 大小
            textField.font = [UIFont systemFontOfSize:20];
        }];
    }
    
    
    //4，模态视图 方式显示出来
    [self presentViewController:alertController animated:YES completion:^{
        
        
    }];
}

- (void)commonalertView {
    [common showAlertViewWithTitle:@"" message:@"" makeSureTitle:@"" cancelTitle:@"quxiao" aboveController:self sureblock:^{
        NSLog(@"sure");
    } cancelblock:^{
        NSLog(@"cancle");
        
    }];
}

- (void)commonActionSheet {
    
    __weak typeof(self) weakSelf = self;
    NSArray *actionBtnTitle = @[@"更换封面",@"个人资料"];
    [common showActionSheetWithTitle:nil buttonArray:actionBtnTitle aboveController:self isNeedDestructive:NO atIndex:0 buttonblock:^(NSInteger btnIndex) {
        __strong typeof (weakSelf) strongSelf =weakSelf;
        [strongSelf actionSheetTag:0 clickedButtonAtIndex:btnIndex];
        
    } cancelblock:^(NSInteger cancelIndex) {
        __strong typeof (weakSelf) strongSelf =weakSelf;
        [strongSelf actionSheetTag:0 clickedButtonAtIndex:cancelIndex];
        
    }];
}
- (void)actionSheetTag:(NSInteger)tag clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}






@end
