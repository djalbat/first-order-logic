Boolean isVariableFree(Node termNode, Node statementNode) {
  Boolean variableBound = isVariableBound(termNode, statementNode);

  Boolean variableFree = !variableBound;

  return variableFree;
}

Boolean isVariableBound(Node termNode, Node statementNode) {
  String variableIdentitifer = variableIdentitiferFromTermNode(termNode);

  Boolean variableBound = 

    if (variableIdentitifer != "")
      variableBoundFromVariableIdentifierAndStatementNode(variableIdentitifer, statementNode)

    else
      false
  ;
  
  return variableBound;
}

String variableIdentitiferFromTermNode(Node termNode) {
  Node variableIdentifierTerminalNode = nodeQuery(termNode, "/term/variable!/@identifier");
  
  String variableIdentitifer = 

    if (variableIdentifierTerminalNode != null) {
      { String content as variableIdentitifer } = variableIdentifierTerminalNode;
    
      return variableIdentitifer;
    } 

    else 
      ""
  ;
  
  return variableIdentitifer;
}

String boundVariableIdentifierFromStatementNode(Node statementNode) {
  { Nodes childNodes as statementChildNodes } = statementNode;

  [ Node firstStatementChildNode ] = statementChildNodes;

  { Boolean terminal } = firstStatementChildNode;

  String boundVariableIdentifier = 

    if (terminal) 
      boundVariableIdentifierFromStatementChildNodes(statementChildNodes)

    else 
      ""
  ;
    
  return boundVariableIdentifier;
}

String boundVariableIdentifierFromStatementChildNodes(Nodes statementChildNodes) {
  [ Node terminalNode ] = statementChildNodes;

  { String content } = terminalNode;

  String boundVariableIdentifier = 

    if ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = statementChildNodes;

      String boundVariableIdentifier = boundVariableIdentifierFromArgumentNode(argumentNode);
  
      return boundVariableIdentifier;
    }
    else
     ""
  ;

  return boundVariableIdentifier;
}

String boundVariableIdentifierFromArgumentNode(Node argumentNode) {
  Node boundVariableIdentityTerminalNode = nodeQuery(argumentNode, "/argument/term/variable!/@identifier");

  String boundVariableIdentifier = 

    if (boundVariableIdentityTerminalNode != null) {
      { String content as boundVariableIdentifier } = boundVariableIdentityTerminalNode;
      
      return boundVariableIdentifier;
    }

    else
      ""
  ;
    
  return boundVariableIdentifier;
}

Boolean variableBoundFromVariableIdentifierAndStatementNode(String variableIdentitifer, Node statementNode) {
  Nodes statementNodes = nodesQuery(statementNode, "//statement");

  Boolean variableBound = some(statementNodes, Boolean (Node statementNode) {
    String boundVariableIdentifier = boundVariableIdentifierFromStatementNode(statementNode); 

    Boolean variableBound = (boundVariableIdentifier == variableIdentitifer);

    return variableBound;
  });

  return variableBound;
}
