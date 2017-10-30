//
//  YJNFormUnderlineTextView.m
//  FunctionTest
//
//  Created by YangJing on 2017/10/30.
//  Copyright © 2017年 YangJing. All rights reserved.
//

#import "YJNFormUnderlineTextView.h"
@interface YJNFormUnderlineTextView()<UITextViewDelegate>
@property (nonatomic, assign) NSUInteger numberOfLines;
@end
@implementation YJNFormUnderlineTextView
-(instancetype)initWithFont:(UIFont *)font {
    self = [self init];
    self.font = font;
    NSLog(@"self.font=%@,lineHeight=%f",self.font,self.font.lineHeight);
    return self;
}
-(instancetype)init {
    if (self = [super init]) {
        self.tintColor = [UIColor redColor];
        self.delegate = self;
        _numberOfLines = 0;
    }
    return self;
}

-(CGRect)caretRectForPosition:(UITextPosition *)position {
    CGRect oriRect = [super caretRectForPosition:position];
    oriRect.size.height = 12;
    oriRect.size.width = 2;
    return oriRect;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    
    //start a new path
    CGContextBeginPath(context);
    
    //Find the number of lines
    NSLog(@"lines=%d",(int)_numberOfLines);
    CGFloat baselineOffset = 6.0f;
    for (int i = 0; i <= _numberOfLines; i++) {
        if (i == 0) {
            CGContextMoveToPoint(context, self.bounds.origin.x, self.font.lineHeight + 2.0f + baselineOffset);
            CGContextAddLineToPoint(context, self.bounds.size.width, self.font.lineHeight + 2.0f + baselineOffset);
        }else {
            CGContextMoveToPoint(context, self.bounds.origin.x, self.font.lineHeight * i + 2.0f + baselineOffset);
            CGContextAddLineToPoint(context, self.bounds.size.width, self.font.lineHeight * i + 2.0f + baselineOffset);
        }
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

-(void)textViewDidChange:(UITextView *)textView {
    NSUInteger number = (self.contentSize.height - 20) / self.font.lineHeight + 1;
    if (_numberOfLines != number) {
        _numberOfLines = number;
        NSLog(@"lineHeight=%f,font=%@",self.font.lineHeight,self.font);
        [self setNeedsDisplay];
    }
}

@end
