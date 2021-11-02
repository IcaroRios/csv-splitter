#!/bin/bash

rm x*
split -l 1000 PagSeguro.csv
for i in x*;do
    mv "$i" "$i.csv";
    if [[ "$i.csv" != "xaa.csv" ]];then
        ex -sc "1i|Número do cartão;Id da Transação;Data da Transação;Identificação;Operação;Bandeira;Forma de Pagamento;Valor;Código da venda;" -cx "$i.csv"
    fi
done