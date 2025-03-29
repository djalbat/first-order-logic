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
  Node variableNameTerminalNode = nodeQuery(termNode, "/term/variable/@name");
  
  String variableName = 

    If (variableNameTerminalNode != null) {
      { String content As variableName } = variableNameTerminalNode;
    
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
  Node boundVariableNameTerminalNode = nodeQuery(argumentNode, "/argument/term/variable/@name");

  String boundVariableName = 

    If (boundVariableNameTerminalNode != null) {
      { String content As boundVariableName } = boundVariableNameTerminalNode;
      
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
