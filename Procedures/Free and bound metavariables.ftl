Boolean isMetavariableFree(Node frameNode, Node statementNode) {
  Boolean metavariableBound = isMetavariableBound(frameNode, statementNode);

  Boolean metavariableFree = !metavariableBound;

  Return metavariableFree;
}

Boolean isMetavariableBound(Node frameNode, Node statementNode) {
  String metavariableName = metavariableNameFromTermNode(frameNode);

  Boolean metavariableBound = 

    If (metavariableName != "")
      metavariableBoundFromMetavariableNameAndStatementNode(metavariableName, statementNode)

    Else
      false
  ;
  
  Return metavariableBound;
}

String metavariableNameFromTermNode(Node frameNode) {
  Node metavariableNameTerminalNode = nodeQuery(frameNode, /frame/metavariable/@name);
  
  String metavariableName = 

    If (metavariableNameTerminalNode != null) {
      { String content As metavariableName } = metavariableNameTerminalNode;
    
      Return metavariableName;
    } 

    Else 
      ""
  ;
  
  Return metavariableName;
}

String boundMetavariableNameFromStatementNode(Node statementNode) {
  { Nodes childNodes As statementChildNodes } = statementNode;

  [ Node firstStatementChildNode ] = statementChildNodes;

  { Boolean terminal } = firstStatementChildNode;

  String boundMetavariableName = 

    If (terminal) 
      boundMetavariableNameFromStatementChildNodes(statementChildNodes)

    Else 
      ""
  ;
    
  Return boundMetavariableName;
}

String boundMetavariableNameFromStatementChildNodes(Nodes statementChildNodes) {
  [ Node terminalNode ] = statementChildNodes;

  { String content } = terminalNode;

  String boundMetavariableName = 

    If ((content == "∀") || (content == "∃")) {
      [ _, Node argumentNode ] = statementChildNodes;

      String boundMetavariableName = boundMetavariableNameFromArgumentNode(argumentNode);
  
      Return boundMetavariableName;
    }
    Else
     ""
  ;

  Return boundMetavariableName;
}

String boundMetavariableNameFromArgumentNode(Node argumentNode) {
  Node boundMetavariableNameTerminalNode = nodeQuery(argumentNode, /argument/frame/metavariable/@name);

  String boundMetavariableName = 

    If (boundMetavariableNameTerminalNode != null) {
      { String content As boundMetavariableName } = boundMetavariableNameTerminalNode;
      
      Return boundMetavariableName;
    }

    Else
      ""
  ;
    
  Return boundMetavariableName;
}

Boolean metavariableBoundFromMetavariableNameAndStatementNode(String metavariableName, Node statementNode) {
  Nodes statementNodes = nodesQuery(statementNode, //statement);

  Boolean metavariableBound = Some(statementNodes, Boolean (Node statementNode) {
    String boundMetavariableName = boundMetavariableNameFromStatementNode(statementNode); 

    Boolean metavariableBound = (boundMetavariableName == metavariableName);

    Return metavariableBound;
  });

  Return metavariableBound;
}
