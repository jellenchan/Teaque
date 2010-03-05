//
//  TQContentView.m
//  Teaque
//
//  Created by Jellen Chan on 10-2-24.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import "TQContentView.h"
#import "TQNaviBar.h"


@implementation TQContentView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
	{
		m_naviBar = [[TQNaviBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
		m_naviBar.delegate = self;
		[self addSubview:m_naviBar];
		m_contentView = [[TQTransView alloc] initWithFrame:CGRectMake(0, 44, 320, 416)];
		[self addSubview:m_contentView];
		m_viewTags = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setCurrentView:(UIView *)view transType:(TQTransType)type
{
	if (view == nil)
		return;
	
	[m_contentView transToView:view withTransType:type];
}

- (BOOL)pushView:(UIView *)view transAni:(BOOL)ani naviTitle:(NSString *)title viewTag:(NSString *)tag
{
	if (view == nil || tag == nil)
	{
		return NO;
	}
	
	UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:title];
	[m_naviBar pushNavigationItem:item animated:ani];
	[item release];
	
	[m_viewTags addObject:tag];
	[m_contentView transToView:view withTransType:(ani ? TQTransTypeFromRight : TQTransTypeNone)];
	return YES;
}

- (BOOL)popToView:(UIView *)view transAni:(BOOL)ani
{
	if (view == nil)
	{
		return NO;
	}
	
	[m_contentView transToView:view withTransType:(ani ? TQTransTypeFromLeft : TQTransTypeNone)];
	return YES;
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
	if (navigationBar == m_naviBar && [m_viewTags count] > 0)
	{
		if ([self respondsToSelector:@selector(naviItemPopped:)])
			[self naviItemPopped:[m_viewTags lastObject]];
		[m_viewTags removeLastObject];
	}
	
	return YES;
}

- (void)dealloc
{
	[m_naviBar release];
	[m_contentView release];
	[m_viewTags release];
    [super dealloc];
}

@end
