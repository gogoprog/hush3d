package test;

import unityengine.MonoBehaviour;
import hush.Hush;

@:nativeGen
class TestMain extends MonoBehaviour
{
    public function Start()
    {
        Hush.engine.addSystem(new TestSystem(), 1);

        var e = Hush.createEntityFromPrefab("TestPrefab");

        Hush.engine.addEntity(e);
    }
}
