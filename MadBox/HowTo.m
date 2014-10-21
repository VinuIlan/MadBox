//
//  HowTo.m
//  MadBox
//
//  Created by Vinu Ilangovan on 2/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HowTo.h"


@implementation HowTo

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HowTo *layer = [HowTo node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"How To Button.png" selectedImage:@"How To Button.png"];
        
        CCMenu *menu = [CCMenu menuWithItems:item1, nil];
        
        [self addChild:menu];
        
	}
	return self;
}

@end
