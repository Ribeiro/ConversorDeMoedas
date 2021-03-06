//
//  CDMViewController.h
//  ConversorDeMoeda
//
//  Created by Geovanny Ribeiro on 25/12/13.
//  Copyright (c) 2013 Geovanny Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtValorOriginal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMoedaOrigem;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segMoedaDestino;
@property (weak, nonatomic) IBOutlet UILabel *labResultado;
- (IBAction)toqueConverter:(id)sender;

@end
