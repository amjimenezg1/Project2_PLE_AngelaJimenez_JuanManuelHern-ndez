module Main

import Syntax;
import AST;
import ParseTree;
import IO;

void main() {
    tree = parse(#start[Module], |project://project2ple/instance/spec1.veri|);
    ast = implode(#Module, tree);
    println(ast);
}