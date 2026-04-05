module Syntax

//Project 2 PLE
// Layout: whitespace and comments
layout Layout = WhitespaceAndComment* !>> [\ \t\n\r#];
lexical WhitespaceAndComment
  = [\ \t\n\r]
  | @category="Comment" "#" ![\n]* $;

// START SYMBOL

start syntax Module
  = verilangModule: 'defmodule' ID name Import* imports Declaration* decls 'end';

//IMPORTS 

syntax Import
  = importDecl: 'using' ID moduleName;

//DECLARATIONS

syntax Declaration
  = ruleD:       RuleDecl
  | operatorD:   OperatorDecl
  | expressionD: ExpressionDecl
  | spaceD:      SpaceDecl
  | varD:        VarDecl;

//RULES

syntax RuleDecl
  = ruleDecl: 'defrule' OperatorApplication '-\>' OperatorApplication 'end';

syntax OperatorApplication
  = operatorApp: '(' ID op Expression+ args ')';

//EXPRESSIONS 

syntax Expression
  = expr: Primary
  | infix: Expression InfixOperator Expression;

syntax Primary
  = primaryId:    ID
  | primaryApp:   OperatorApplication
  | primaryQuant: QuantifiedExpression;

syntax InfixOperator
  = infixId:     ID
  | infixMul:    '*'
  | infixDiv:    '/'
  | infixMinus:  '-'
  | infixPlus:   '+'
  | infixPow:    '**'
  | infixMod:    '%'
  | infixLt:     '\<'
  | infixGt:     '\>'
  | infixLeq:    '\<='
  | infixGeq:    '\>='
  | infixNeq:    '\<\>'
  | infixEq:     '='
  | infixAnd:    'and'
  | infixOr:     'or'
  | infixNeg:    'neg'
  | infixArrow:  '-\>'
  | infixIn:     'in'
  | infixEquiv:  '≡'
  | infixDArrow: '=\>'
  | infixDot:    '.';

syntax QuantifiedExpression
  = forallExpr: 'forall' ID var 'in' ID domain '.' Expression body
  | existsExpr: 'exists' ID var 'in' ID domain '.' Expression body;

//OPERATORS

syntax OperatorDecl
  = operatorDecl: 'defoperator' ID name ':' OperatorType opType Attributes? attrs 'end';

syntax OperatorType
  = operatorType: ID first ArrowID* rest;

syntax ArrowID
  = arrowId: '-\>' ID target;
//ATTRIBUTES

syntax Attributes
  = attributes: '[' Attribute+ attrList ']';

syntax Attribute
  = attrSimple: ID
  | attrPair:   ID ':' ID;

//EXPRESSION, SPACE, AND VAR DECLARATIONS 

syntax ExpressionDecl
  = expressionDecl: 'defexpression' Expression expr Attributes? attrs 'end';

syntax SpaceDecl
  = spaceDecl: 'defspace' ID name ('\<' ID parent)? 'end';

syntax VarDecl
  = varDecl: 'defvar' {VarBinding ","}+ bindings 'end';

syntax VarBinding
  = varBinding: ID varName ':' ID varType;

//TOKENS

lexical ID = ([a-zA-Z][a-zA-Z0-9\-]* !>> [a-zA-Z0-9\-]) \ Reserved;

keyword Reserved
  = 'defmodule' | 'using'    | 'defspace'  | 'defrule'
  | 'defvar'    | 'end'      | 'defoperator' | 'defexpression'
  | 'forall'    | 'exists'   | 'and'       | 'or'
  | 'neg'       | 'in' ;