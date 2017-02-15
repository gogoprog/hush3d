package hush;

import ash.tools.ListIteratingSystem;
import ash.core.*;

class TestSystem extends ListIteratingSystem<TestNode>
{
    public function new()
       {
           super(TestNode, updateNode, onNodeAdded, onNodeRemoved);
       }

       public override function addToEngine(engine:Engine)
       {
           super.addToEngine(engine);
       }

       private function updateNode(node:TestNode, dt:Float):Void
       {

       }

       private function onNodeAdded(node:TestNode)
       {
           unityengine.Debug.Log("TestNode added!");
       }

       private function onNodeRemoved(node:TestNode)
       {
           unityengine.Debug.Log("TestNode removed!");
       }
}
