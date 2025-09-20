Boolean isVariableFree(Node termNode, Node statementNode) {
  Boolean variableBound = isVariableBound(termNode, statementNode);

  Boolean variableFree = !variableBound;

  Return variableFree;
}

Boolean isVariableBound(Node termNode, Node statementNode) {
  String variableName = variableNameFromTermNode(termNode);

  Boolean variableBound = 

    If (variableName != "")
      variableBoundFromVariableNameAndStatementNode(variableName, statementNode)

    Else
      false
  ;
  
  Return variableBound;
}

String variableNameFromTermNode(Node termNode) {
  Node variableIdentityTerminalNode = nodeQuery(termNode, "/term/variable/@identifier");
  
  String variableName = 

    If (variableIdentityTerminalNode != null) {
      { String content As variableName } = variableIdentityTerminalNode;
    
      Return variableName;
    } 

    Else 
      ""
  ;
  
  Return variableName;
}

String boundVariableNameFromStatementNode(Node statementNode) {
  { Nodes childNodes As statementChildNodes } = statementNode;

  [ Node firstStatementChildNode ] = statementChildNodes;

  { Boolean terminal } = firstStatementChildNode;

  String boundVariableName = 

    If (terminal) 
      boundVariableNameFromStatementChildNodes(statementChildNodes)

    Else 
      ""
  ;
    
  Return boundVariableName;
}

String boundVariableNameFromStatementChildNodes(Nodes statementChildNodes) {
  [ Node terminalNode ] = statementChildNodes;

  { String content } = terminalNode;

  String boundVariableName = 

    If ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = statementChildNodes;

      String boundVariableName = boundVariableNameFromArgumentNode(argumentNode);
  
      Return boundVariableName;
    }
    Else
     ""
  ;

  Return boundVariableName;
}

String boundVariableNameFromArgumentNode(Node argumentNode) {
  Node boundVariableIdentityTerminalNode = nodeQuery(argumentNode, "/argument/term/variable/@identifier");

  String boundVariableName = 

    If (boundVariableIdentityTerminalNode != null) {
      { String content As boundVariableName } = boundVariableIdentityTerminalNode;
      
      Return boundVariableName;
    }

    Else
      ""
  ;
    
  Return boundVariableName;
}

Boolean variableBoundFromVariableNameAndStatementNode(String variableName, Node statementNode) {
  Nodes statementNodes = nodesQuery(statementNode, "//statement");

  Boolean variableBound = Some(statementNodes, Boolean (Node statementNode) {
    String boundVariableName = boundVariableNameFromStatementNode(statementNode); 

    Boolean variableBound = (boundVariableName == variableName);

    Return variableBound;
  });

  Return variableBound;
}
