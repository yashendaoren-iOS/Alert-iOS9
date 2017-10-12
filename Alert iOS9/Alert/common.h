//
//  common.h
//  Alert
//
//  Created by Silver on 2017/9/26.
//  Copyright © 2017年 Silver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CANCELINDEX 10000

@interface common : NSObject

//UIActionSheet
/*
 title:标题，可为空
 buttonArray:存放按钮显示文字的数组，不可为空
 controller:需要显示的目标界面
 isNeedDestructive:是否需要字体标红  index:字体标红的位置
 btnIndex:点击了第一个按钮
 取消 cancelIndex==CANCELINDEX
 
 */
+ (void)showActionSheetWithTitle:(NSString *)title buttonArray:(NSArray *)buttonArray aboveController:(UIViewController *)controller isNeedDestructive:(BOOL)isNeedDestructive atIndex:(NSInteger)index buttonblock:(void(^)(NSInteger btnIndex))buttonblock cancelblock:(void(^)(NSInteger cancelIndex))cancelblock;
//UIAlertView
/*
 title:标题，可为空
 message:提示内容，可为空
 cancelTitle:取消按钮的文案 可为空（为空不显示）
 sureTitle:确定按钮，可为空    （若cancelTitle，sureTitle同时为空，则显示确定按钮，文案为@“确定”）
 controller:需要显示的目标界面
 */
+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message makeSureTitle:(NSString *)sureTitle cancelTitle:(NSString *)cancelTitle aboveController:(UIViewController *)controller sureblock:(void(^)())sureblock cancelblock:(void(^)())cancelblock;
@end
