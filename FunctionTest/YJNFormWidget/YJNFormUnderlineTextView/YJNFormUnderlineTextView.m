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
@property (nonatomic, assign) CGFloat spaceMutiple;
@property (nonatomic, strong) UIFont *customFont;
@property (nonatomic, strong) NSMutableParagraphStyle *paraStyle;
@end
@implementation YJNFormUnderlineTextView
-(instancetype)initWithFont:(UIFont *)font {
    self = [self init];
    _customFont = font;
    _paraStyle = [[NSMutableParagraphStyle alloc] init];
    _paraStyle.lineHeightMultiple = 1;
    return self;
}
-(instancetype)init {
    if (self = [super init]) {
        _customFont = self.font;
        self.delegate = self;
        _numberOfLines = 0;
        self.returnKeyType = UIReturnKeyDone;
    }
    return self;
}



-(void)setText:(NSString *)text {
    if (text.length) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineHeightMultiple = 2.0f;
        
        NSDictionary *attribute = @{NSReadOnlyDocumentAttribute:@2,
                                    NSParagraphStyleAttributeName:paragraph,
                                    NSFontAttributeName:[UIFont systemFontOfSize:14.0f]
                                    };
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:text attributes:attribute];
        [self setAttributedText:attr];
    }
}

-(void)setAttributedText:(NSAttributedString *)attributedText {
    if (attributedText.string.length) {
        NSRange range = NSMakeRange(0, attributedText.length);
        NSRangePointer pointer = &range;
        NSDictionary *attr = [attributedText attributesAtIndex:0 effectiveRange:pointer];
        _customFont = [attr objectForKey:@"NSFont"];
        _paraStyle = [attr objectForKey:@"NSParagraphStyle"];
        [super setAttributedText:attributedText];
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    NSUInteger number = (self.contentSize.height) / (_customFont.lineHeight * _paraStyle.lineHeightMultiple);
    if (_numberOfLines != number) {
        _numberOfLines = number;
        [self setNeedsDisplay];
    }
}

-(CGRect)caretRectForPosition:(UITextPosition *)position {
    CGRect oriRect = [super caretRectForPosition:position];
    oriRect.size.height = _customFont.lineHeight + 2;
    oriRect.size.width = 2;
    oriRect.origin.y += _customFont.lineHeight;
    return oriRect;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0].CGColor);
    CGContextSetLineWidth(context, 1.0f);
    
    CGContextBeginPath(context);
    
    CGFloat baselineOffset = 6.0f;
    for (int i = 0; i <= _numberOfLines; i++) {
        if (i == 0) {
            CGContextMoveToPoint(context, self.bounds.origin.x, _customFont.lineHeight * _paraStyle.lineHeightMultiple + 2.0f + baselineOffset);
            CGContextAddLineToPoint(context, self.bounds.size.width, _customFont.lineHeight * _paraStyle.lineHeightMultiple + 2.0f + baselineOffset);
        }else {
            CGContextMoveToPoint(context, self.bounds.origin.x, _customFont.lineHeight * _paraStyle.lineHeightMultiple * i + 2.0f + baselineOffset);
            CGContextAddLineToPoint(context, self.bounds.size.width, _customFont.lineHeight * _paraStyle.lineHeightMultiple * i + 2.0f + baselineOffset);
        }
    }
    
    CGContextClosePath(context);
    CGContextStrokePath(context);
}
#pragma mark - UITextViewDelegate
-(void)textViewDidChange:(UITextView *)textView {
    if (self.yjn_delegate) {
        [_yjn_delegate yjn_textDidchanged:self];
    }
    NSUInteger number = (self.contentSize.height) / (_customFont.lineHeight * _paraStyle.lineHeightMultiple);
    if (_numberOfLines != number) {
        _numberOfLines = number;
        [self setNeedsDisplay];
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

@end
