Boolean isMetavariableFree(Node frameNode, Node statementNode) {
  Boolean metavariableFree = true;

  Boolean metavariableBound = isMetavariableBound(frameNode, statementNode);

  If (metavariableBound) {
    metavariableFree = false;
  }

  Return metavariableFree;
}

Boolean isMetavariableBound(Node frameNode, Node statementNode) {
  Boolean metavariableBound = false;
    
  String metavariableName = metavariableNameFromFrameNode(frameNode);
  
  If (metavariableName != "") {
    Nodes statementNodes = nodesQuery(statementNode, //statement);

    ForEach(statementNodes, (Node statementNode) {
      If (!metavariableBound) {
        String boundMetavariableName = boundMetavariableNameFromStatementNode(statementNode); 
      
        If (boundMetavariableName == metavariableName) {
          metavariableBound = true;
        }
      }
    });
  }
  
  Return metavariableBound;
}
  
String metavariableNameFromFrameNode(Node frameNode) {
  String metavariableName = "";
  
  Node metavariableNameTerminalNode = nodeQuery(frameNode, /frame/metavariable/@name);
  
  If (metavariableNameTerminalNode != null) {
    { String content } = metavariableNameTerminalNode;
    
    metavariableName = content;
  }
  
  Return metavariableName;
}

String boundMetavariableNameFromStatementNode(Node statementNode) {
  String boundMetavariableName = "";
  
  { Nodes childNodes } = statementNode;
  
  [ Node firstChildNode ] = childNodes;

  { Boolean frameinal } = firstChildNode;

  If (frameinal) {
    { String content } = firstChildNode;
  
    If ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = childNodes;
      
      Node boundMetavariableNameTerminalNode = nodeQuery(argumentNode, /argument/frame/metavariable/@name);
    
      If (boundMetavariableNameTerminalNode != null) {
        { String content } = boundMetavariableNameTerminalNode;
      
        boundMetavariableName = content;
      }
    }
  }
    
  Return boundMetavariableName;
}
