//
//  TQContentView.h
//  Teaque
//
//  Created by Jellen Chan on 10-2-24.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQView.h"
#import "TQTransView.h"


@class TQNaviBar;

@protocol TQNaviBarDelegate
@optional
- (void)naviItemPopped:(NSString *)viewTag;
@end

@interface TQContentView : TQView <UINavigationBarDelegate, TQNaviBarDelegate>
{
@private
	TQNaviBar *m_naviBar;
	TQTransView *m_contentView;
	NSMutableArray *m_viewTags;
}

- (void)setCurrentView:(UIView *)view transType:(TQTransType)type;

- (BOOL)pushView:(UIView *)view transAni:(BOOL)ani naviTitle:(NSString *)title viewTag:(NSString *)tag;
- (BOOL)popToView:(UIView *)view transAni:(BOOL)ani;

@end
