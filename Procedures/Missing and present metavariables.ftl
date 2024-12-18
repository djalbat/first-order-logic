Boolean isMetavariableMissing(Node frameNode, Node statementNode) {
  Boolean metavariableMissing = true;

  Boolean metavariablePresent = isMetavariablePresent(frameNode, statementNode);

  If (metavariablePresent) {
    metavariableMissing = false;
  }

  Return metavariableMissing;
}

Boolean isMetavariablePresent(Node frameNode, Node statementNode) {
  Boolean metavariablePresent = false;
    
  String metavariableName = metavariableNameFromFrameNode(frameNode);
  
  If (metavariableName != "") {
    Nodes frameNodes = nodesQuery(frameNode, //frame);

    ForEach(frameNodes, (Node frameNode) {
      If (!metavariablePresent) {
        String presentMetavariableName = presentMetavariableNameFromFrameNode(frameNode); 
      
        If (presentMetavariableName == metavariableName) {
          metavariablePresent = true;
        }
      }
    });
  }
  
  Return metavariablePresent;
}

String presentMetavariableNameFromFrameNode(Node frameNode) {
  String metavariableName = metavariableNameFromFrameNode(frameNode),
         presentMetavariableName = metavariableName;
    
  Return presentMetavariableName;
}
