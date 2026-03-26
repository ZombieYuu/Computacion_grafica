using UnityEngine;

public class DardoMovimiento : MonoBehaviour
{
    public Transform destino;
    public float velocidad = 10f;

    void Update()
    {
        if (destino != null)
        {
            transform.position = Vector3.MoveTowards(
                transform.position,
                destino.position,
                velocidad * Time.deltaTime
            );

            transform.LookAt(destino);
            transform.Rotate(90f, 0f, 0f);
        }
    }
}