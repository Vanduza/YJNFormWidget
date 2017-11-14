//
//  YJNFormUnderlineTextView.h
//  FunctionTest
//
//  Created by YangJing on 2017/10/30.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YJNFormUnderlineTextView;
@protocol YJNFormUnderlineTextViewDelegate
-(void)yjn_textDidchanged:(YJNFormUnderlineTextView *)textView;
@end
@interface YJNFormUnderlineTextView : UITextView
@property (nonatomic, weak) id <YJNFormUnderlineTextViewDelegate> yjn_delegate;
-(instancetype)initWithFont:(UIFont *)font;
@end
