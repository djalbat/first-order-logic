Boolean isVariableFree(Node termNode, Node statementNode) {
  Boolean variableBound = isVariableBound(termNode, statementNode);

  Boolean variableFree = !variableBound;

  Return variableFree;
}

Boolean isVariableBound(Node termNode, Node statementNode) {
  String variableIdentitifer = variableIdentitiferFromTermNode(termNode);

  Boolean variableBound = 

    If (variableIdentitifer != "")
      variableBoundFromVariableIdentifierAndStatementNode(variableIdentitifer, statementNode)

    Else
      false
  ;
  
  Return variableBound;
}

String variableIdentitiferFromTermNode(Node termNode) {
  Node variableIdentifierTerminalNode = nodeQuery(termNode, "/term/variable!/@identifier");
  
  String variableIdentitifer = 

    If (variableIdentifierTerminalNode != null) {
      { String content As variableIdentitifer } = variableIdentifierTerminalNode;
    
      Return variableIdentitifer;
    } 

    Else 
      ""
  ;
  
  Return variableIdentitifer;
}

String boundVariableIdentifierFromStatementNode(Node statementNode) {
  { Nodes childNodes As statementChildNodes } = statementNode;

  [ Node firstStatementChildNode ] = statementChildNodes;

  { Boolean terminal } = firstStatementChildNode;

  String boundVariableIdentifier = 

    If (terminal) 
      boundVariableIdentifierFromStatementChildNodes(statementChildNodes)

    Else 
      ""
  ;
    
  Return boundVariableIdentifier;
}

String boundVariableIdentifierFromStatementChildNodes(Nodes statementChildNodes) {
  [ Node terminalNode ] = statementChildNodes;

  { String content } = terminalNode;

  String boundVariableIdentifier = 

    If ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = statementChildNodes;

      String boundVariableIdentifier = boundVariableIdentifierFromArgumentNode(argumentNode);
  
      Return boundVariableIdentifier;
    }
    Else
     ""
  ;

  Return boundVariableIdentifier;
}

String boundVariableIdentifierFromArgumentNode(Node argumentNode) {
  Node boundVariableIdentityTerminalNode = nodeQuery(argumentNode, "/argument/term/variable!/@identifier");

  String boundVariableIdentifier = 

    If (boundVariableIdentityTerminalNode != null) {
      { String content As boundVariableIdentifier } = boundVariableIdentityTerminalNode;
      
      Return boundVariableIdentifier;
    }

    Else
      ""
  ;
    
  Return boundVariableIdentifier;
}

Boolean variableBoundFromVariableIdentifierAndStatementNode(String variableIdentitifer, Node statementNode) {
  Nodes statementNodes = nodesQuery(statementNode, "//statement");

  Boolean variableBound = Some(statementNodes, Boolean (Node statementNode) {
    String boundVariableIdentifier = boundVariableIdentifierFromStatementNode(statementNode); 

    Boolean variableBound = (boundVariableIdentifier == variableIdentitifer);

    Return variableBound;
  });

  Return variableBound;
}
