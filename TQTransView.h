//
//  TQTransView.h
//  Teaque
//
//  Created by Jellen Chan on 10-2-24.
//  Copyright 2010 Zixer Lab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQView.h"


typedef enum __TQTransType
{
	TQTransTypeNone,
	TQTransTypeFade,
	TQTransTypeFromLeft,
	TQTransTypeFromRight,
	TQTransTypeFromTop,
	TQTransTypeFromBottom,
	TQTransTypeFlipFromLeft,
	TQTransTypeFlipFromRight,
	TQTransTypeCurlUp,
	TQTransTypeCurlDown
} TQTransType;


@interface TQTransView : TQView
{
@private
	UIView *m_curView;
	BOOL m_isTransmitting;
}

- (BOOL)transToView:(UIView *)view withTransType:(TQTransType)transType;

@end
