package hush;

import ash.core.*;
import unityengine.Time;
import unityengine.MonoBehaviour;
import unityengine.Component;
import unityengine.Debug;
import unityengine.GameObject;

class EntityWrapper extends MonoBehaviour
{
    public var entity:Entity;

    public function new()
    {
        super();
    }
}

@:nativeGen
class Hush extends MonoBehaviour
{
    private static var engine:Engine;

    public function Awake()
    {
        engine = new Engine();

        engine.addSystem(new TestSystem(), 1);


        var e = createEntity(GameObject.Find("Sphere"));


        engine.addEntity(e);
    }

    public function Update()
    {
        engine.update(Time.deltaTime);
    }

    public function createEntity(gameObject:GameObject):Entity
    {
        var e = new Entity();

        var components:cs.NativeArray<Component> = untyped __cs__("gameObject.GetComponents<UnityEngine.Component>()");

        for(component in components)
        {
            e.add(component);
        }

        untyped __cs__("gameObject.AddComponent<EntityWrapper>()");

        return e;
    }
}
