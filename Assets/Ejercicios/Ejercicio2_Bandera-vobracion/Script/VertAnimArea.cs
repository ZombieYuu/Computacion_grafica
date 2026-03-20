using UnityEngine;

[ExecuteInEditMode]

public class VertAnimArea : MonoBehaviour
{
    [SerializeField] private float Radius;
    [SerializeField] private Material targetMaterial;




    // Update is called once per frame
    void Update()
    {
        Vector3 pos = transform.position;
        Vector4 sphere = new Vector4(pos.x, pos.y, pos.z, w:Radius);
        targetMaterial?.SetVector(name:"_SphereDescriptor", sphere);

    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;

        Gizmos.DrawWireSphere(transform.position, Radius);

    }

}
