//
//  TQNaviBar.h
//  Teaque
//
//  Created by Jellen Chan on 09-7-8.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TQNaviBar : UINavigationBar
{
@private
	UIImage *m_backgroundImage;
	UIImage *m_returnImage;
	UIImage *m_returnPressedImage;
}

- (id)initWithFrame:(CGRect)frame;

- (void)setBackgroundImage:(UIImage *)image;
- (void)setReturnButtonImage:(UIImage *)image;
- (void)setReturnButtonPressedImage:(UIImage *)image;

@end
