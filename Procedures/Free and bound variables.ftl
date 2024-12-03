Boolean isVariableFree(Node termNode, Node statementNode) {
  Boolean variableFree = true;

  Boolean variableBound = isVariableBound(termNode, statementNode);

  If (variableBound) {
    variableFree = false;
  }

  Return variableFree;
}

Boolean isVariableBound(Node termNode, Node statementNode) {
  Boolean variableBound = false;
    
  String variableName = variableNameFromTermNode(termNode);
  
  If (variableName != null) {
    Nodes statementNodes = nodesQuery(statementNode, //statement);

    ForEach(statementNodes, (Node statementNode) {
      String boundVariableName = boundVariableNameFromStatementNode(statementNode); 
      
      If (boundVariableName == variableName) {
        variableBound = true;
      }
    });
  }
  
  Return variableBound;
}
  
String variableNameFromTermNode(Node termNode) {
  String variableName = null;
  
  Node variableNameTerminalNode = nodeQuery(termNode, /term/variable/@name);
  
  If (variableNameTerminalNode != null) {
    { String content } = variableNameTerminalNode;
    
    variableName = content;
  }
  
  Return variableName;
}

String boundVariableNameFromStatementNode(Node statementNode) {
  String boundVariableName = null;
  
  { Nodes childNodes } = statementNode;
  
  [ Node firstChildNode ] = childNodes;
  
  { String content } = firstChildNode;
  
  If ((content == "∀") || (content == "∃")) {
    [ _, Node argumentNode ] = childNodes;
    
    Node boundVariableNameTerminalNode = nodeQuery(argumentNode, /argument/term/variable/@name);
    
    If (boundVariableNameTerminalNode != null) {
      { content } = boundVariableNameTerminalNode;
      
      boundVariableName = content;
    }
  }
    
  Return boundVariableName;
}
