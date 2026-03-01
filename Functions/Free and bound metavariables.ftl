Boolean isMetavariableFree(Node frameNode, Node statementNode) {
  Boolean metavariableBound = isMetavariableBound(frameNode, statementNode);

  Boolean metavariableFree = !metavariableBound;

  return metavariableFree;
}

Boolean isMetavariableBound(Node frameNode, Node statementNode) {
  String metavariableName = metavariableNameFromFrameNode(frameNode);

  Boolean metavariableBound = 

    if (metavariableName != "")
      metavariableBoundFromMetavariableNameAndStatementNode(metavariableName, statementNode)

    else
      false
  ;
  
  return metavariableBound;
}

String metavariableNameFromFrameNode(Node frameNode) {
  Node metavariableNameTerminalNode = nodeQuery(frameNode, "/frame/metavariable!/@name");
  
  String metavariableName = 

    if (metavariableNameTerminalNode != null) {
      { String content as metavariableName } = metavariableNameTerminalNode;
    
      return metavariableName;
    } 

    else 
      ""
  ;
  
  return metavariableName;
}

String boundMetavariableNameFromStatementNode(Node statementNode) {
  { Nodes childNodes as statementChildNodes } = statementNode;

  [ Node firstStatementChildNode ] = statementChildNodes;

  { Boolean terminal } = firstStatementChildNode;

  String boundMetavariableName = 

    if (terminal) 
      boundMetavariableNameFromStatementChildNodes(statementChildNodes)

    else 
      ""
  ;
    
  return boundMetavariableName;
}

String boundMetavariableNameFromStatementChildNodes(Nodes statementChildNodes) {
  [ Node terminalNode ] = statementChildNodes;

  { String content } = terminalNode;

  String boundMetavariableName = 

    if ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = statementChildNodes;

      String boundMetavariableName = boundMetavariableNameFromArgumentNode(argumentNode);
  
      return boundMetavariableName;
    }
    else
     ""
  ;

  return boundMetavariableName;
}

String boundMetavariableNameFromArgumentNode(Node argumentNode) {
  Node boundMetavariableNameTerminalNode = nodeQuery(argumentNode, "/argument/frame/metavariable!/@name");

  String boundMetavariableName = 

    if (boundMetavariableNameTerminalNode != null) {
      { String content as boundMetavariableName } = boundMetavariableNameTerminalNode;
      
      return boundMetavariableName;
    }

    else
      ""
  ;
    
  return boundMetavariableName;
}

Boolean metavariableBoundFromMetavariableNameAndStatementNode(String metavariableName, Node statementNode) {
  Nodes statementNodes = nodesQuery(statementNode, "//statement");

  Boolean metavariableBound = some(statementNodes, Boolean (Node statementNode) {
    String boundMetavariableName = boundMetavariableNameFromStatementNode(statementNode); 

    Boolean metavariableBound = (boundMetavariableName == metavariableName);

    return metavariableBound;
  });

  return metavariableBound;
}
