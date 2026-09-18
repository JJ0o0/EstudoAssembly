#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Erro: Forneça o nome do arquivo .asm como argumento."
    echo "Uso: $0 <arquivo.asm>"
    exit 1
fi

ASM_FILE="$1"
BASENAME=$(basename "$ASM_FILE" .asm)
OBJ_FILE="bin/${BASENAME}.o"
BIN_FILE="bin/${BASENAME}"

if [ ! -f "$ASM_FILE" ]; then
    echo "Erro: Arquivo '$ASM_FILE' não encontrado."
    exit 1
fi

mkdir -p bin

echo "Montando $ASM_FILE..."
nasm -f elf64 "$ASM_FILE" -o "$OBJ_FILE"

echo "Linkando $OBJ_FILE..."
ld "$OBJ_FILE" -o "$BIN_FILE"

echo "Executando $BIN_FILE..."
echo "----------------------------------------"
"./$BIN_FILE"