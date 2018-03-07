//
//  YJNFormQuestionConfigProtocol.h
//  XMessageChatDemo
//
//  Created by YangJing on 2017/10/31.
//  Copyright © 2017年 杨敬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMsgQuestionModel.h"

@protocol YJNFormQuestionConfigProtocol <NSObject>
-(void)yjn_configViewWithQuestion:(XMsgQuestionModel *)question;
@optional
-(void)yjn_prepareForReuse;
@end
