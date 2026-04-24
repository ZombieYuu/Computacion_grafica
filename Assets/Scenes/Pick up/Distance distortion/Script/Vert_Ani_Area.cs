using UnityEngine;

[ExecuteInEditMode]

public class Vert_Ani_Area : MonoBehaviour
{

        [SerializeField] private float radius;
        [SerializeField] private Material targetMatirial;

    // Update is called once per frame
    void Update()
    {
        Vector3 pos = transform.position;
        Vector4 sphere = new Vector4(pos.x, pos.y, pos.z, w:radius);
        targetMatirial.SetVector(name:"_SphereDes", sphere);
    }

    void OnDrawGizmos()

    {

        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, radius);
        
    }
}
