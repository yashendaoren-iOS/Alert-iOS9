//
//  common.m
//  Alert
//
//  Created by Silver on 2017/9/26.
//  Copyright © 2017年 Silver. All rights reserved.
//

#import "common.h"


@implementation common
+ (void)showActionSheetWithTitle:(NSString *)title buttonArray:(NSArray *)buttonArray aboveController:(UIViewController *)controller isNeedDestructive:(BOOL)isNeedDestructive atIndex:(NSInteger)index buttonblock:(void(^)(NSInteger btnIndex))buttonblock cancelblock:(void(^)(NSInteger cancelIndex))cancelblock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //去除空的字符串
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i <buttonArray.count; i++) {
        NSString *str = buttonArray[i];
        if (![str isEqualToString:@""]) {
            [array addObject:str];
        }
    }
    
    if (array.count==0) {
        return;
    }else{
        //1, 创建按钮  取消样式UIAlertActionStyleCancel
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelblock(CANCELINDEX);
        }];
        [alertController addAction:action];
        
        //2,创建按钮 确认样式UIAlertActionStyleDefault
        for (int i = 0; i <array.count; i++) {
            NSString *titleStr = array[i];
            [alertController addAction:({
                
                //UIAlertActionStyleDefault 字体默认颜色
                //UIAlertActionStyleDestructive 字体改为红色
                UIAlertActionStyle style = UIAlertActionStyleDefault;
                if (isNeedDestructive==YES&&index==i) {
                    style = UIAlertActionStyleDestructive;
                }
                UIAlertAction *action = [UIAlertAction actionWithTitle:titleStr style:style handler:^(UIAlertAction * _Nonnull action) {
                    buttonblock(i);
                }];
                action;
            })];
        }
    }
    
    //3，模态视图 方式显示出来
    [controller presentViewController:alertController animated:YES completion:^{
        
    }];
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message makeSureTitle:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle aboveController:(UIViewController *)controller sureblock:(void(^)())sureblock cancelblock:(void(^)())cancelblock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelTitle!=nil&&![cancelTitle isEqualToString:@""]) {
        //1, 创建按钮  取消样式UIAlertActionStyleCancel
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelblock();
        }];
        [alertController addAction:action];
    }
    
    if ((sureTitle==nil||[sureTitle isEqualToString:@""])&&(cancelTitle==nil||[cancelTitle isEqualToString:@""])) {
        sureTitle = @"确定";
    }
    if (sureTitle!=nil&&![sureTitle isEqualToString:@""]) {
        //2，创建按钮 确认样式UIAlertActionStyleDefault
        [alertController addAction:({
            UIAlertAction *action = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                sureblock();
            }];
            action;
        })];
        
    }
    //3，模态视图 方式显示出来
    [controller presentViewController:alertController animated:YES completion:^{
        
    }];
}


@end
