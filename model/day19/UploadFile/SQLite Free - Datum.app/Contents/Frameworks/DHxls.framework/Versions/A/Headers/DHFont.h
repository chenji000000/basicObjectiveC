//
//  DHFont.h
//  DHxls
//
//  Created by David Hoerl on 10/7/08.
//  Copyright 2008-2013 David Hoerl. All rights reserved.
//

@interface DHFont : NSObject

//+(DHFont *)fontWithName:(NSString *)fontName;
-(instancetype)initWithFont:(void *)ft ;	// xlslib_core::CFont *
@property (readonly) void *font;

@property (copy) NSString *name;
@property (NS_NONATOMIC_IOSONLY) unsigned short height;
-(void)setBoldStyle:(boldness_option_t)fntboldness;
-(unsigned short)boldStyle;
-(void)setUnderlineStyle:(underline_option_t)fntunderline;
-(unsigned char)underlineStyle;
-(void)SetScriptStyle:(script_option_t)fntscript;
@property (readonly) unsigned short scriptStyle;
-(void)setColorName:(color_name_t)fntcolor;
-(void)setColorIndex:(unsigned8_t)fntcolor;
-(unsigned short)colorIndex;

@property (NS_NONATOMIC_IOSONLY) BOOL italic;
-(void)setStrikeout:(BOOL)so;
@property (readonly) BOOL strikeOut;
@property (NS_NONATOMIC_IOSONLY) BOOL outline;

@property (NS_NONATOMIC_IOSONLY) unsigned char family;
@property (NS_NONATOMIC_IOSONLY) unsigned char charset;

@end
