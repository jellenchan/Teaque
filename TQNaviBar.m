//
//  TQNaviBar.m
//  Teaque
//
//  Created by Jellen Chan on 09-7-8.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import "TQNaviBar.h"
#import <QuartzCore/CoreAnimation.h>


@interface UINavigationBar (PlusMethods)

- (void)drawBackButtonBackgroundInRect:(CGRect)rect withStyle:(UIBarStyle)style pressed:(BOOL)pressed;

@end



@implementation TQNaviBar

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
	{
		m_backgroundImage = nil;
		m_returnImage = nil;
		m_returnPressedImage = nil;
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)image
{
	if (image)
	{
		[image retain];
		[m_backgroundImage release];
		m_backgroundImage = image;
		self.layer.contents = (id)m_backgroundImage.CGImage;
	}
}

- (void)setReturnButtonImage:(UIImage *)image
{
	if (image == nil)
	{
		return;
	}
	
	[image retain];
	[m_returnImage release];
	m_returnImage = image;
}

- (void)setReturnButtonPressedImage:(UIImage *)image
{
	if (image == nil)
	{
		return;
	}
	
	[image retain];
	[m_returnPressedImage release];
	m_returnPressedImage = image;
}

- (void)drawBackButtonBackgroundInRect:(CGRect)rect withStyle:(UIBarStyle)style pressed:(BOOL)pressed
{
	if (m_returnImage == nil)
	{
		[super drawBackButtonBackgroundInRect:rect withStyle:style pressed:pressed];
	}
	else
	{
		if (pressed && m_returnPressedImage)
		{
			[m_returnPressedImage drawInRect:rect];
		}
		else
		{
			[m_returnImage drawInRect:rect];
		}
	}
}

- (void)dealloc
{
	[m_backgroundImage release];
	m_backgroundImage = nil;
	[m_returnImage release];
	m_returnImage = nil;
	[m_returnPressedImage release];
	m_returnPressedImage = nil;
	
    [super dealloc];
}

@end
