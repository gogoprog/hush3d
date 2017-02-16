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
    public static var engine:Engine;

    public function new()
    {
        super();
    }

    public function Awake()
    {
        engine = new Engine();
    }

    public function Update()
    {
        engine.update(Time.deltaTime);
    }

    static public function createEntity(gameObject:GameObject):Entity
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

    static public function createEntityFromPrefab(prefabName:String):Entity
    {
        var go = untyped __cs__("(UnityEngine.GameObject)UnityEngine.Object.Instantiate(UnityEngine.Resources.Load(prefabName))");
        return createEntity(go);
    }
}
