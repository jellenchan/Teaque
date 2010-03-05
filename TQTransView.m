//
//  TQTransView.m
//  Teaque
//
//  Created by Jellen Chan on 10-2-24.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import "TQTransView.h"
#import <QuartzCore/QuartzCore.h>


#define kTransmitTime 0.33
#define kTransmitAniName @"TQTransmitAnimation"

@implementation TQTransView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
	{
		m_curView = nil;
		m_isTransmitting = NO;
    }
    return self;
}

- (BOOL)transToView:(UIView *)view withTransType:(TQTransType)transType
{
	if (view == nil || m_isTransmitting)
	{
		return NO;
	}
	
	if (m_curView)
	{
		[m_curView removeFromSuperview];
	}
	m_curView = view;
	[self addSubview:view];

	if (transType >= TQTransTypeFade && transType <= TQTransTypeFromBottom)
	{
		CATransition *animation = [CATransition animation];
		[animation setDelegate:self];
		if (transType == TQTransTypeFade)
		{
			[animation setType:kCATransitionFade];
		}
		else if (transType == TQTransTypeFromLeft)
		{
			[animation setType:kCATransitionPush];
			[animation setSubtype:kCATransitionFromLeft];
		}
		else if (transType == TQTransTypeFromRight)
		{
			[animation setType:kCATransitionPush];
			[animation setSubtype:kCATransitionFromRight];			
		}
		else if (transType == TQTransTypeFromTop)
		{
			[animation setType:kCATransitionPush];
			[animation setSubtype:kCATransitionFromTop];			
		}
		else if (transType == TQTransTypeFromBottom)
		{
			[animation setType:kCATransitionPush];
			[animation setSubtype:kCATransitionFromBottom];			
		}
		[animation setDuration:kTransmitTime];
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		[[self layer] addAnimation:animation forKey:kTransmitAniName];
	}
	else if (transType >= TQTransTypeFlipFromLeft && transType <= TQTransTypeCurlDown)
	{
		[self animationDidStart:nil];
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDuration:kTransmitTime];
		if (transType == TQTransTypeFlipFromLeft)
			[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
		else if (transType == TQTransTypeFlipFromRight)
			[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:YES];
		else if (transType == TQTransTypeCurlUp)
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self cache:YES];
		else if (transType == TQTransTypeCurlDown)
			[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self cache:YES];
		[UIView commitAnimations];
	}
	
	return YES;
}

- (void)animationDidStart:(CAAnimation *)theAnimation
{
	m_isTransmitting = YES;
	self.userInteractionEnabled = NO;
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	m_isTransmitting = NO;
	self.userInteractionEnabled = YES;
}

- (void)dealloc
{
    [super dealloc];
}

@end
