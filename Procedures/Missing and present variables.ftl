Boolean isVariableMissing(Node termNode, Node statementNode) {
  Boolean variableMissing = true;

  Boolean variablePresent = isVariablePresent(termNode, statementNode);

  If (variablePresent) {
    variableMissing = false;
  }

  Return variableMissing;
}

Boolean isVariablePresent(Node termNode, Node statementNode) {
  Boolean variablePresent = false;
    
  String variableName = variableNameFromTermNode(termNode);
  
  If (variableName != "") {
    Nodes termNodes = nodesQuery(termNode, //term);

    ForEach(termNodes, (Node termNode) {
      If (!variablePresent) {
        String presentVariableName = presentVariableNameFromTermNode(termNode); 
      
        If (presentVariableName == variableName) {
          variablePresent = true;
        }
      }
    });
  }
  
  Return variablePresent;
}

String presentVariableNameFromTermNode(Node termNode) {
  String variableName = variableNameFromTermNode(termNode),
         presentVariableName = variableName;
    
  Return presentVariableName;
}
