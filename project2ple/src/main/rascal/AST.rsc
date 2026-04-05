module AST

data Module
  = verilangModule(str name, list[Import] imports, list[Declaration] decls);

data Import
  = importDecl(str moduleName);

data Declaration
  = ruleD(RuleDecl ruleDecl)
  | operatorD(OperatorDecl operatorDecl)
  | expressionD(ExpressionDecl expressionDecl)
  | spaceD(SpaceDecl spaceDecl)
  | varD(VarDecl varDecl);

data RuleDecl
  = ruleDecl(OperatorApplication lhs, OperatorApplication rhs);

data OperatorApplication
  = operatorApp(str op, list[Expression] args);

data Expression
  = expr(Primary primary)
  | infix(Expression lhs, InfixOperator op, Expression rhs);

data Primary
  = primaryId(str name)
  | primaryApp(OperatorApplication app)
  | primaryQuant(QuantifiedExpression quant);

data InfixOperator
  = infixId(str name)
  | infixMul()
  | infixDiv()
  | infixMinus()
  | infixPlus()
  | infixPow()
  | infixMod()
  | infixLt()
  | infixGt()
  | infixLeq()
  | infixGeq()
  | infixNeq()
  | infixEq()
  | infixAnd()
  | infixOr()
  | infixNeg()
  | infixArrow()
  | infixIn()
  | infixEquiv()
  | infixDArrow()
  | infixDot();

data QuantifiedExpression
  = forallExpr(str var, str domain, Expression body)
  | existsExpr(str var, str domain, Expression body);

data OperatorDecl
  = operatorDecl(str name, OperatorType opType, list[Attributes] attrs);

data OperatorType
  = operatorType(str first, list[ArrowID] rest);

data ArrowID
  = arrowId(str target);

data Attributes
  = attributes(list[Attribute] attrList);

data Attribute
  = attrSimple(str name)
  | attrPair(str key, str val);

data ExpressionDecl
  = expressionDecl(Expression expr, list[Attributes] attrs);

data SpaceDecl
  = spaceDecl(str name, list[str] parent);

data VarDecl
  = varDecl(list[VarBinding] bindings);

data VarBinding
  = varBinding(str varName, str varType);