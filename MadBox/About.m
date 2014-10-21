//
//  About.m
//  MadBox
//
//  Created by Vinu Ilangovan on 2/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "About.h"


@implementation About

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	About *layer = [About node];
	
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
		
		CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"About Button.png" selectedImage:@"About Button.png"];
        
        CCMenu *menu = [CCMenu menuWithItems:item1, nil];
        
        [self addChild:menu];
        
	}
	return self;
}

@end
