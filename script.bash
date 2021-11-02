#!/bin/bash

rm x*
filename="${1:-PagSeguro.csv}"
lines=${2:-1000}

split -l $lines $filename
[ ! -f "$filename" ] && { echo "$0 - Arquivo $filename Não encontrado"; exit 1; }
for i in x*;do
    mv "$i" "$i.csv";
    if [[ "$i.csv" != "xaa.csv" ]];then
        ex -sc "1i|Número do cartão;Id da Transação;Data da Transação;Identificação;Operação;Bandeira;Forma de Pagamento;Valor;Código da venda;" -cx "$i.csv"
    fi
done