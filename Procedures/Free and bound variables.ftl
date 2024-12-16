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
  
  If (variableName != "") {
    Nodes statementNodes = nodesQuery(statementNode, //statement);

    ForEach(statementNodes, (Node statementNode) {
      If (!variableBound) {
        String boundVariableName = boundVariableNameFromStatementNode(statementNode); 
      
        If (boundVariableName == variableName) {
          variableBound = true;
        }
      }
    });
  }
  
  Return variableBound;
}
  
String variableNameFromTermNode(Node termNode) {
  String variableName = "";
  
  Node variableNameTerminalNode = nodeQuery(termNode, /term/variable/@name);
  
  If (variableNameTerminalNode != null) {
    { String content } = variableNameTerminalNode;
    
    variableName = content;
  }
  
  Return variableName;
}

String boundVariableNameFromStatementNode(Node statementNode) {
  String boundVariableName = "";
  
  { Nodes childNodes } = statementNode;
  
  [ Node firstChildNode ] = childNodes;

  { Boolean terminal } = firstChildNode;

  If (terminal) {
    { String content } = firstChildNode;
  
    If ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = childNodes;
      
      Node boundVariableNameTerminalNode = nodeQuery(argumentNode, /argument/term/variable/@name);
    
      If (boundVariableNameTerminalNode != null) {
        { String content } = boundVariableNameTerminalNode;
      
        boundVariableName = content;
      }
    }
  }
    
  Return boundVariableName;
}
