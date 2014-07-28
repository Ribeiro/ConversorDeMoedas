//
//  CDMViewController.m
//  ConversorDeMoeda
//
//  Created by Geovanny Ribeiro on 25/12/13.
//  Copyright (c) 2013 Geovanny Ribeiro. All rights reserved.
//

#import "CDMViewController.h"

@interface CDMViewController ()

@end

@implementation CDMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtValorOriginal resignFirstResponder];
}

- (IBAction)toqueConverter:(id)sender {
    NSString *moedaOrigem = @"";
    NSString *moedaDestino = @"";
    
    switch ([self.segMoedaOrigem selectedSegmentIndex]) {
        case 0:
            moedaOrigem = @"BRL";
            break;
        case 1:
            moedaOrigem = @"USD";
            break;
        case 2:
            moedaOrigem = @"EUR";
            break;

    }
    
    switch ([self.segMoedaDestino selectedSegmentIndex]) {
        case 0:
            moedaDestino = @"BRL";
            break;
        case 1:
            moedaDestino = @"USD";
            break;
        case 2:
            moedaDestino = @"EUR";
            break;
            
    }

    NSString *enderecoAPI = [[NSString alloc]initWithFormat:@"http://rate-exchange.appspot.com/currency?from=%@&to=%@", moedaOrigem, moedaDestino];
    
    NSString *resposta = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:enderecoAPI] encoding:NSUTF8StringEncoding error:nil];
    
    //NSError *err = nil;
    //NSArray *arr = [NSJSONSerialization JSONObjectWithData:[resposta dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];
    
    
    NSArray *vetorResposta1 = [resposta componentsSeparatedByString:@","];
    NSArray *vetorResposta2 = [[vetorResposta1 objectAtIndex:1] componentsSeparatedByString:@":"];
    
    float taxa = [[vetorResposta2 objectAtIndex:1] floatValue];
    float quantia = [self.txtValorOriginal.text floatValue];
    float resultado = taxa * quantia;
    
    NSString *resultadoString = [NSString stringWithFormat: @"%f", resultado];


    [self.labResultado setText:resultadoString];
    [self.txtValorOriginal resignFirstResponder];
    
}
@end
